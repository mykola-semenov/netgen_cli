catch {lappend auto_path $env(NETGENDIR) }
catch {lappend auto_path $env(NETGENDIR)/../lib }
load libgui[info sharedlibextension] gui

if { [Ng_GetCommandLineParameter help]=="defined" || [Ng_GetCommandLineParameter h]=="defined" } {
    puts "Usage: netgen --shellmode { options }"
    puts "Options:"
    puts "--help, -h              Show this help message"
    puts "--geofile filename      Input geometry file"
    puts "--meshfile filename     Output mesh file"
    puts "--meshsizefile filename Load mesh-size file with local mesh sizes"
    puts "--meshfiletype <\"Netgen\"|\"Neutral Format\"|\"Surface Mesh Format\"|"
    puts "                \"DIFFPACK Format\"|\"TecPlot Format\"|"
    puts "                \"Tochnog Format\"|\"Abaqus Format\"|\"Fluent Format\"|"
    puts "                \"Permas Format\"|\"FEAP Format\"|\"Elmer Format\"|"
    puts "                \"STL Format\"|\"STL Extended Format\"|\"VRML Format\"|"
    puts "                \"Gmsh Format\"|\"Gmsh2 Format\"|\"OpenFOAM 1.5+ Format\"|"
    puts "                \"OpenFOAM 1.5+ Compressed\"|\"JCMwave Format\"|\"TET Format\">"
    puts "                        Format of output mesh, default is netgen native format"
    puts "-V                      Print additional information"
    Ng_Exit;
    exit
}

source ./variables.tcl
proc setgranularity { gran } {
    if {$gran == 6} { return }
    set gran [expr $gran - 1]

    global options.curvaturesafety
    set surfcurvlist { 1 1.5 2 3 5 }
    set options.curvaturesafety [lindex $surfcurvlist $gran]

    global options.segmentsperedge
    set spelist { 0.3 0.5 1 2 3 }
    set options.segmentsperedge [lindex $spelist $gran]
    
    global stloptions.resthsurfcurvfac
    set surfcurvfaclist { 0.25 0.5 1 1.5 3 }
    set stloptions.resthsurfcurvfac [lindex $surfcurvfaclist $gran]

    global stloptions.resthchartdistfac
    set chartdistfaclist { 0.8 1 1.5 2 5 }
    set stloptions.resthchartdistfac [lindex $chartdistfaclist $gran]

    global stloptions.resthlinelengthfac
    set linelengthfaclist { 0.2 0.35 0.5 1.5 3 }
    set stloptions.resthlinelengthfac [lindex $linelengthfaclist $gran]

    global stloptions.resthcloseedgefac
    set closeedgefaclist { 0.5 1 2 3.5 5 }
    set stloptions.resthcloseedgefac [lindex $closeedgefaclist $gran]

    global stloptions.resthminedgelen
    set minedgelenlist { 0.002 0.02 0.2 1.0 2.0 5.0 10.0 }
    set stloptions.resthminedgelen [lindex $minedgelenlist $gran]
	
    global stloptions.resthedgeanglefac
    set edgeanglefaclist { 0.25 0.5 1 1.5 3 }
    set stloptions.resthedgeanglefac [lindex $edgeanglefaclist $gran]

    global stloptions.resthsurfmeshcurvfac 
    set surfmeshcurvlist { 1 1.5 2 3 5 }
    set stloptions.resthsurfmeshcurvfac [lindex $surfmeshcurvlist $gran]

    global options.grading
    set gradinglist { 0.7 0.5 0.3 0.2 0.1 }
    set options.grading [lindex $gradinglist $gran]   
}
setgranularity ${meshoptions.fineness}

Ng_SetMeshingParameters
Ng_SetDebugParameters
Ng_STLDoctor
Ng_GeometryOptions set

set geofilename [Ng_GetCommandLineParameter geofile]
if { $geofilename == "undefined" } {
    puts "Error: --geofile is not set"
    Ng_Exit;
    exit
}

if { [ catch { Ng_LoadGeometry $geofilename } errstring] == 0 } {
    Ng_ParseGeometry
} {
    puts "Problem with input file:"
    puts "$errstring"
    Ng_Exit;
    exit
}

set meshsizefilename [Ng_GetCommandLineParameter meshsizefile]
if { $meshsizefilename != "undefined" } {
    set options.meshsizefilename $meshsizefilename
}

Ng_GenerateMesh ${meshoptions.firststep} ${meshoptions.laststep}

set meshfilename [Ng_GetCommandLineParameter meshfile]
if { $meshfilename == "undefined" } {
    set meshfilename out.vol
    puts "Warning: --meshfile is not set, using $meshfilename"
}

set meshfiletype [Ng_GetCommandLineParameter meshfiletype]
if { $meshfiletype == "undefined" } {
    set meshfiletype Netgen
    puts "Warning: --meshfiletype is not set, using $meshfiletype"
}

if { $meshfiletype == "Netgen" } {
    Ng_SaveMesh $meshfilename
} else {
    if { [catch { Ng_ExportMesh $meshfilename $meshfiletype } ] == 1 } {
	puts "Unknown file format $meshfiletype"
    }
}
Ng_Exit;

