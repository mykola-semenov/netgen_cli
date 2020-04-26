# netgen global tcl-variables

set drawmode rotate
set selectvisual geometry

set dirname .
set loadgeomtypevar "All Geometry types"

set basefilename filename

set meshoptions.fineness 6
set meshoptions.firststep ag
set meshoptions.laststep ov
set options.memory 0

set options.localh 1
set options.delaunay 1
set options.checkoverlap 1
set options.checkoverlappingboundary 0
set options.checkchartboundary 1
set options.startinsurface 0
set options.blockfill 1
set options.debugmode 0
set options.dooptimize 1
set options.parthread 0
set options.elsizeweight 0.2
set options.secondorder 0
set options.elementorder 1
set options.quad 0
set options.try_hexes 0
set options.inverttets 0
set options.inverttrigs 0
set options.autozrefine 0

set options.meshsize 1000
set options.minmeshsize 0

set options.curvaturesafety 2
set options.segmentsperedge 2
set options.meshsizefilename ""
set options.badellimit 175
set options.optsteps2d 3
set options.optsteps3d 5
set options.opterrpow 2

set options.grading 0.5
set options.printmsg 2

set options.parallel_meshing 1
set options.nthreads 4

set debug.slowchecks 0
set debug.debugoutput 0
set debug.haltexistingline 0
set debug.haltoverlap 0
set debug.haltsuccess 0
set debug.haltnosuccess 0
set debug.haltlargequalclass 0
set debug.haltsegment 0
set debug.haltnode 0
set debug.haltface 0
set debug.haltfacenr 0
set debug.haltsegmentp1 0
set debug.haltsegmentp2 0

set geooptions.drawcsg 1
set geooptions.detail 0.001
set geooptions.accuracy 1e-6
set geooptions.facets 20
set geooptions.minx -1000
set geooptions.miny -1000
set geooptions.minz -1000
set geooptions.maxx 1000
set geooptions.maxy 1000
set geooptions.maxz 1000

set viewqualityplot 0
set memuseplot 0
set viewrotatebutton 0
set showsensitivehelp 0
set showhelpline 0

set viewoptions.specpointvlen 0.3
set viewoptions.light.amb 0.3
set viewoptions.light.diff 0.7
set viewoptions.light.spec 1
set viewoptions.light.locviewer 0
set viewoptions.mat.shininess 50
set viewoptions.mat.transp 0.3
set viewoptions.colormeshsize 0
set viewoptions.whitebackground 1
set viewoptions.drawcoordinatecross 1
set viewoptions.drawcolorbar 1
set viewoptions.drawnetgenlogo 1
set viewoptions.stereo 0
set viewoptions.shrink 1

set viewoptions.drawfilledtrigs 1
set viewoptions.drawedges 0
set viewoptions.drawbadels 0
set viewoptions.centerpoint 0
set viewoptions.drawelement 0
set viewoptions.drawoutline 1
set viewoptions.drawtets 0
set viewoptions.drawtetsdomain 0
set viewoptions.drawprisms 0
set viewoptions.drawpyramids 0
set viewoptions.drawhexes 0
set viewoptions.drawidentified 0
set viewoptions.drawpointnumbers 0
set viewoptions.drawedgenumbers 0
set viewoptions.drawfacenumbers 0
set viewoptions.drawelementnumbers 0
set viewoptions.drawdomainsurf 0

set viewoptions.drawededges 1
set viewoptions.drawedpoints 1
set viewoptions.drawedpointnrs 0
set viewoptions.drawedtangents 0
set viewoptions.drawededgenrs 0
set viewoptions.drawmetispartition 0

set viewoptions.drawcurveproj 0
set viewoptions.drawcurveprojedge 1

set viewoptions.clipping.nx 0
set viewoptions.clipping.ny 1
set viewoptions.clipping.nz 0
set viewoptions.clipping.dist 0
set viewoptions.clipping.dist2 0
set viewoptions.clipping.enable 0
set viewoptions.clipping.onlydomain 0
set viewoptions.clipping.notdomain 0

set viewoptions.usecentercoords 0
set viewoptions.centerx 0
set viewoptions.centery 0
set viewoptions.centerz 0

set viewoptions.drawspecpoint 0
set viewoptions.specpointx 0
set viewoptions.specpointy 0
set viewoptions.specpointz 0

set stloptions.showtrias 0
set stloptions.showfilledtrias 1
set stloptions.showedges 1
set stloptions.showmarktrias 0
set stloptions.showactivechart 0
set stloptions.yangle 30
set stloptions.contyangle 20
set stloptions.edgecornerangle 60
set stloptions.chartangle 15
set stloptions.outerchartangle 70
set stloptions.usesearchtree 0
set stloptions.chartnumber 1
set stloptions.charttrignumber 1
set stloptions.chartnumberoffset 0

set stloptions.atlasminh 0.1
set stloptions.resthsurfcurvfac 2
set stloptions.resthsurfcurvenable 0
set stloptions.resthatlasfac 2
set stloptions.resthatlasenable 1
set stloptions.resthchartdistfac 1.2
set stloptions.resthchartdistenable 1
set stloptions.resthlinelengthfac 0.5
set stloptions.resthlinelengthenable 1
set stloptions.resthcloseedgefac 1
set stloptions.resthcloseedgeenable 1
set stloptions.resthminedgelen 0.01
set stloptions.resthminedgelenenable 1
set stloptions.resthedgeanglefac 1
set stloptions.resthedgeangleenable 0
set stloptions.resthsurfmeshcurvfac 1
set stloptions.resthsurfmeshcurvenable 0
set stloptions.recalchopt 1

set stldoctor.drawmeshededges 1
set stldoctor.geom_tol_fact 0.000001
set stldoctor.useexternaledges 0
set stldoctor.showfaces 0
set stldoctor.conecheck 1
set stldoctor.spiralcheck 1
set stldoctor.selecttrig 0
set stldoctor.selectmode 1
set stldoctor.longlinefact 0
set stldoctor.showexcluded 1
set stldoctor.edgeselectmode 0
set stldoctor.nodeofseltrig 1
set stldoctor.showtouchedtrigchart 0
set stldoctor.showedgecornerpoints 0
set stldoctor.showmarkedtrigs 1
set stldoctor.dirtytrigfact 0.01
set stldoctor.smoothangle 90
set stldoctor.selectwithmouse 1
set stldoctor.showvicinity 0
set stldoctor.vicinity 50
set stldoctor.smoothnormalsweight 0.2

set occoptions.showvolumenr 0
set occoptions.showsurfaces 1
set occoptions.showedges 1
set occoptions.showsolidnr 0
set occoptions.showsolidnr2 0
set occoptions.visproblemfaces 0
set occoptions.zoomtohighlightedentity 0
set occoptions.deflection 1
set occoptions.tolerance 1e-3
set occoptions.fixsmalledges 1
set occoptions.fixspotstripfaces 1
set occoptions.sewfaces 1
set occoptions.makesolids 1
set occoptions.splitpartitions 0

set meshdoctor.active 0
set meshdoctor.markedgedist 1

# variablenname mit punkt problematisch!
set status_np 0
set status_ne 0
set status_nse 0
set status_working " "
set status_task " "
set status_percent 0
set status_filename 0
set status_tetqualclasses "10 20 30 40 10 20 30 40 10 20 30 40 10 20 30 40 10 20 30 40"

set exportfiletype "Neutral Format"

set preproc.facenr 0
set preproc.selectmode query
set preproc.numtrig 0

set mem_moveable 0

set multithread_pause 0
set multithread_testmode 0
set multithread_redraw 0
set multithread_drawing 0
set multithread_terminate 0
set multithread_running 0

set level 0

set tablesforoutput {}

set optlist {
    options.localh 
    options.delaunay 
    options.checkoverlap 
    options.startinsurface 
    options.blockfill 
    options.dooptimize 
    options.elsizeweight 
    options.meshsize 
    options.minmeshsize 
    options.curvaturesafety 
    options.optsteps2d 
    options.optsteps3d 
    options.secondorder
}

set visoptions.usetexture 1
set visoptions.invcolor 0
set visoptions.imaginary 0
set visoptions.lineartexture 0
set visoptions.numtexturecols 16
set visoptions.showclipsolution 1
set visoptions.showsurfacesolution 0
set visoptions.drawfieldlines 0
set visoptions.drawpointcurves 1
set visoptions.numfieldlines 100
set visoptions.fieldlinesrandomstart 0
set visoptions.fieldlinesstartarea box
set visoptions.fieldlinesstartareap1x 1
set visoptions.fieldlinesstartareap1y 1
set visoptions.fieldlinesstartareap1z 1
set visoptions.fieldlinesstartareap2x 0
set visoptions.fieldlinesstartareap2y 0
set visoptions.fieldlinesstartareap2z 0
set visoptions.fieldlinesstartface -1
set visoptions.fieldlinesfilename none
set visoptions.fieldlinestolerance 0.0005
set visoptions.fieldlinesrktype crungekutta
set visoptions.fieldlineslength 0.5
set visoptions.fieldlinesmaxpoints 500
set visoptions.fieldlinesthickness 0.0015
set visoptions.fieldlinesvecfunction none
set visoptions.fieldlinesphase 0
set visoptions.fieldlinesonlyonephase 1

set visoptions.lineplotfile empty
set visoptions.lineplotsource file
set visoptions.lineplotusingx 0
set visoptions.lineplotusingy 1
set visoptions.lineplotautoscale 1
set visoptions.lineplotxmin 0
set visoptions.lineplotxmax 1
set visoptions.lineplotymin 0
set visoptions.lineplotymax 1
set visoptions.lineplotcurrentnum -1
set visoptions.lineplotinfos ""
set visoptions.lineplotselected none
set visoptions.lineplotselector ""
set visoptions.lineplotcolor red
set visoptions.lineplotsizex 500
set visoptions.lineplotsizey 400
set visoptions.lineplotselectedeval 0
set visoptions.lineplotdatadescr "column1 column2 column3"
set visoptions.lineplotxcoordselector ""
set visoptions.lineplotycoordselector ""
set visoptions.evaluatefilenames none
set visoptions.evaluatefiledescriptions none

set visoptions.clipsolution none
set visoptions.scalfunction none
set visoptions.vecfunction none
set visoptions.evaluate abs
set visoptions.gridsize 20
set visoptions.xoffset 0
set visoptions.yoffset 0
set visoptions.autoscale 1
set visoptions.redrawperiodic 0
set visoptions.logscale 0
set visoptions.mminval 0
set visoptions.mmaxval 1
set visoptions.isolines 0
set visoptions.isosurf 0
set visoptions.subdivisions 1
set visoptions.numiso 10
set visoptions.autoredraw 0
set visoptions.autoredrawtime 2
set visoptions.simulationtime 0
set visoptions.multidimcomponent 0

# deform by vector function
set visoptions.deformation 0
set visoptions.scaledeform1 1
set visoptions.scaledeform2 1

set parallel_netgen 0

