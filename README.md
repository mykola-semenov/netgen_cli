Netgen command line interface
=============================

Prerequisites
-------------

1. [Netgen & Python 3](https://ngsolve.org/downloads)
2. [PyYAML](https://pypi.org/project/PyYAML/)


Run options
-----------

### Config file

> **Note:** When config file is specified, other command line options are ignored  

```bash
$ python3 netgen_cli.py --config <config> <geometry> <mesh>
```

Use config.yaml as example.

### Command line options

```bash
$ python3 netgen_cli.py [-h] [--geotype geotype] [--meshtype meshtype]
                        [--maxh maxh] [--grading grading]
                        [--meshsize meshsize] [--segmentsperedge segmentsperedge]
                        [--quad_dominated] [--no_blockfill] [--filldist filldist]
                        [--no_delaunay] [--opt3d opt3d] [--optsteps3d optsteps3d]
                        [--opt2d opt2d] [--optsteps2d optsteps2d]
                        [--elsizeweight elsizeweight]
                        [--closeedgefac closeedgefac] [--minedgelen minedgelen]
                        [--yangle yangle] [--contyangle contyangle]
                        [--edgecornerangle edgecornerangle]
                        <geometry> <mesh>
```

Most command line options are self-explanatory:

#### -h, --help
Show help message and exit.

#### --geotype
Input geometry type. Possible values:
```
OCC: IGES / STEP format
STL: STL format
CSG: Constructive solid geometry
Geom2D: Netgen 2D spline geometry
```
Default geotype = "OCC".

#### --meshtype
Output mesh type. Possible values:
```
VOL: Netgen native format
Neutral: Neutral format
Surface: Surface Mesh format
DIFFPACK: DIFFPACK format
TecPlot: TecPlot format
Tochnog: Tochnog format
Abaqus: Abaqus format
Fluent: Fluent format
Permas: Permas format
FEAP: FEAP format
Elmer: Elmer format
STL: STL format
STL_ext: STL Extended format
VRML: VRML format
Gmsh: Gmsh format
Gmsh2: Gmsh2 format
OpenFOAM: OpenFOAM 1.5+ format
OpenFOAM_compressed: OpenFOAM 1.5+ compressed
JCMwave: JCMwave format
TET: TET format
```
Default meshtype = "VOL".
> **Note:** OpenFOAM, OpenFOAM_compressed, JCMwave and TET are **buggy**.

#### --maxh
Global upper bound for mesh size. Default maxh = 1e10.

#### --grading
Mesh grading how fast the local mesh size can change. Default grading = 0.3.

#### --meshsize
Load meshsize from file. Can set local mesh size for points
and along edges. File must have the format:
```text
nr_points
x1, y1, z1, meshsize
x2, y2, z2, meshsize
...
xn, yn, zn, meshsize

nr_edges
x11, y11, z11, x12, y12, z12, meshsize
...
xn1, yn1, zn1, xn2, yn2, zn2, meshsize
```

#### --segmentsperedge
Minimal number of segments per edge. Default segmentsperedge = 1.

#### --quad_dominated
Quad-dominated surface meshing.

#### --no_blockfill
No fast blockfilling.

#### --filldist
Block fill up to distance. Default filldist = 0.1.

#### --no_delaunay
Don't use Delaunay meshing

#### --opt3d
3d optimization strategy:
```
m: move nodes
M: move nodes, cheap functional
s: swap faces
c: combine elements
d: divide elements
```
Default opt3d = "cmdmustm".

#### --optsteps3d
Number of 3d optimization steps. Default optsteps3d = 3.

#### --opt2d
2d optimization strategy:
```
s: swap, opt 6 lines/node
S: swap, optimal elements
m: move nodes
p: plot, no pause
P: plot, pause
c: combine
```
Default opt2d = "smcmSmcmSmcm".

#### --optsteps2d
Number of 2d optimization steps. Default optsteps2d = 3.

#### --elsizeweight
Weight of element size w.r.t. element shape in optimization. Default elsizeweight = 0.2.

#### --closeedgefac
**[OCC / STL specific parameter]** Factor for meshing close edges. Default closeedgefac = 2 for OCC, 1 for STL.

#### --minedgelen
**[OCC / STL specific parameter]** Minimum edge length to be used for dividing edges to mesh points. Default minedgelen = 0.001.

#### --yangle
**[STL specific parameter]** Angle for edge detection. Default yangle = 30.

#### --contyangle
**[STL specific parameter]** Edges continue if angle > contyangle. Default contyangle = 20.

#### --edgecornerangle
**[STL specific parameter]** Angle of geometry edge at which the mesher should set a point. Default edgecornerangle = 60.