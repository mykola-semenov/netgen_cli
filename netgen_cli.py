#!/usr/bin/python3

import argparse
import yaml
from enum import Enum
from netgen import occ, stl, csg, geom2d


class GeoType(Enum):
    OCC = 'OCC'
    STL = 'STL'
    CSG = 'CSG'
    Geom2D = 'Geom2D'

    def __str__(self):
        return self.value


class MeshType(Enum):
    VOL = 'VOL'
    Neutral = 'Neutral'
    Surface = 'Surface'
    DIFFPACK = 'DIFFPACK'
    TecPlot = 'TecPlot'
    Tochnog = 'Tochnog'
    Abaqus = 'Abaqus'
    Fluent = 'Fluent'
    Permas = 'Permas'
    FEAP = 'FEAP'
    Elmer = 'Elmer'
    STL = 'STL'
    STL_ext = 'STL_ext'
    VRML = 'VRML'
    Gmsh = 'Gmsh'
    Gmsh2 = 'Gmsh2'
    OpenFOAM = 'OpenFOAM'
    OpenFOAM_compressed = 'OpenFOAM_compressed'
    JCMwave = 'JCMwave'
    TET = 'TET'

    def __str__(self):
        return self.value


MeshType2Netgen = {
    MeshType.Neutral: 'Neutral Format',
    MeshType.Surface: 'Surface Mesh Format',
    MeshType.DIFFPACK: 'DIFFPACK Format',
    MeshType.TecPlot: 'TecPlot Format',
    MeshType.Tochnog: 'Tochnog Format',
    MeshType.Abaqus: 'Abaqus Format',
    MeshType.Fluent: 'Fluent Format',
    MeshType.Permas: 'Permas Format',
    MeshType.FEAP: 'FEAP Format',
    MeshType.Elmer: 'Elmer Format',
    MeshType.STL: 'STL Format',
    MeshType.STL_ext: 'STL Extended Format',
    MeshType.VRML: 'VRML Format',
    MeshType.Gmsh: 'Gmsh Format',
    MeshType.Gmsh2: 'Gmsh2 Format',
    MeshType.OpenFOAM: 'OpenFOAM 1.5+ Format',
    MeshType.OpenFOAM_compressed: 'OpenFOAM 1.5+ Compressed',
    MeshType.JCMwave: 'JCMwave Format',
    MeshType.TET: 'TET Format',
}


def parse_args():
    parser = argparse.ArgumentParser(description='Command line interface for Netgen.')
    parser.add_argument(
        'geometry',
        metavar='geometry',
        type=str,
        help='input geometry file'
    )
    parser.add_argument(
        'mesh',
        metavar='mesh',
        type=str,
        help='output mesh file'
    )
    parser.add_argument(
        '--config',
        metavar='config',
        type=str,
        help='configuration file as an alternative to command line options'
    )
    parser.add_argument(
        '--geotype',
        metavar='geotype',
        type=GeoType,
        default=GeoType.OCC,
        help='input geometry type (see README.md)'
    )
    parser.add_argument(
        '--meshtype',
        metavar='meshtype',
        type=MeshType,
        default=MeshType.VOL,
        help='output mesh type (see README.md)'
    )
    parser.add_argument(
        '--maxh',
        metavar='maxh',
        type=float,
        default=1.e10,
        help='global upper bound for mesh size'
    )
    parser.add_argument(
        '--grading',
        metavar='grading',
        type=float,
        default=0.3,
        help='mesh grading how fast the local mesh size can change'
    )
    parser.add_argument(
        '--meshsize',
        metavar='meshsize',
        type=str,
        help='load meshsize from file (see README.md)'
    )
    parser.add_argument(
        '--segmentsperedge',
        metavar='segmentsperedge',
        type=float,
        default=1.,
        help='minimal number of segments per edge'
    )
    parser.add_argument(
        '--quad_dominated',
        action='store_true',
        help='quad-dominated surface meshing'
    )
    parser.add_argument(
        '--no_blockfill',
        action='store_true',
        help='no fast blockfilling'
    )
    parser.add_argument(
        '--filldist',
        metavar='filldist',
        type=float,
        default=0.1,
        help='block fill up to distance'
    )
    parser.add_argument(
        '--no_delaunay',
        action='store_true',
        help='don\'t use Delaunay meshing'
    )
    parser.add_argument(
        '--opt3d',
        metavar='opt3d',
        type=str,
        default='cmdmustm',
        help='3d optimization strategy (see README.md)'
    )
    parser.add_argument(
        '--optsteps3d',
        metavar='optsteps3d',
        type=int,
        default=3,
        help='number of 3d optimization steps'
    )
    parser.add_argument(
        '--opt2d',
        metavar='opt2d',
        type=str,
        default='smcmSmcmSmcm',
        help='2d optimization strategy (see README.md)'
    )
    parser.add_argument(
        '--optsteps2d',
        metavar='optsteps2d',
        type=int,
        default=3,
        help='number of 2d optimization steps'
    )
    parser.add_argument(
        '--elsizeweight',
        metavar='elsizeweight',
        type=float,
        default=0.2,
        help='weight of element size w.r.t. element shape in optimization'
    )
    parser.add_argument(
        '--closeedgefac',
        metavar='closeedgefac',
        type=float,
        default=None,  # 2.0 for OCC, 1.0 for STL
        help='[OCC / STL specific parameter] factor for meshing close edges'
    )
    parser.add_argument(
        '--minedgelen',
        metavar='minedgelen',
        type=float,
        default=0.001,
        help='[OCC / STL specific parameter] minimum edge length to be used for dividing edges to mesh points'
    )
    parser.add_argument(
        '--yangle',
        metavar='yangle',
        type=float,
        default=30.,
        help='[STL specific parameter] angle for edge detection'
    )
    parser.add_argument(
        '--contyangle',
        metavar='contyangle',
        type=float,
        default=20.,
        help='[STL specific parameter] edges continue if angle > contyangle'
    )
    parser.add_argument(
        '--edgecornerangle',
        metavar='edgecornerangle',
        type=float,
        default=60.,
        help='[STL specific parameter] angle of geometry edge at which the mesher should set a point'
    )
    args = parser.parse_args()

    if args.config:
        with open(args.config) as f:
            config = yaml.load(f)
        args.geotype = GeoType(config['geotype'])
        args.meshtype = MeshType(config['meshtype'])
        meshing_params = {
            'maxh': config['maxh'],
            'grading': config['grading'],
            'meshsizefilename': config['meshsize'],
            'segmentsperedge': config['segmentsperedge'],
            'quad_dominated': config['quad_dominated'],
            'blockfill': config['blockfill'],
            'filldist': config['filldist'],
            'delaunay': config['delaunay'],
            'optimize3d': config['opt3d'],
            'optsteps3d': config['optsteps3d'],
            'optimize2d': config['opt2d'],
            'optsteps2d': config['optsteps2d'],
            'elsizeweight': config['elsizeweight']
        }
        if args.geotype in {GeoType.OCC, GeoType.STL}:
            meshing_params = {
                **meshing_params,
                'closeedgefac': config['closeedgefac'],
                'minedgelen': config['minedgelen']
            }
            if args.geotype == GeoType.STL:
                meshing_params = {
                    **meshing_params,
                    'yangle': config['yangle'],
                    'contyangle': config['contyangle'],
                    'edgecornerangle': config['edgecornerangle']
                }
    else:
        if args.closeedgefac is None:
            if args.geotype == 'OCC':
                args.closeedgefac = 2.
            elif args.geotype == 'STL':
                args.closeedgefac = 1.
        meshing_params = {
            'maxh': args.maxh,
            'grading': args.grading,
            'meshsizefilename': args.meshsize,
            'segmentsperedge': args.segmentsperedge,
            'quad_dominated': args.quad_dominated,
            'blockfill': not args.no_blockfill,
            'filldist': args.filldist,
            'delaunay': not args.no_delaunay,
            'optimize3d': args.opt3d,
            'optsteps3d': args.optsteps3d,
            'optimize2d': args.opt2d,
            'optsteps2d': args.optsteps2d,
            'elsizeweight': args.elsizeweight
        }
        if args.geotype in {GeoType.OCC, GeoType.STL}:
            meshing_params = {
                **meshing_params,
                'closeedgefac': args.closeedgefac,
                'minedgelen': args.minedgelen
            }
            if args.geotype == GeoType.STL:
                meshing_params = {
                    **meshing_params,
                    'yangle': args.yangle,
                    'contyangle': args.contyangle,
                    'edgecornerangle': args.edgecornerangle
                }

    return args.geometry, args.geotype, args.mesh, args.meshtype, meshing_params


def main():
    geofile, geotype, meshfile, meshtype, args = parse_args()
    print(args)
    if geotype == GeoType.OCC:
        geo = occ.OCCGeometry(geofile)
    elif geotype == GeoType.STL:
        geo = stl.LoadSTLGeometry(geofile)
    elif geotype == GeoType.CSG:
        geo = csg.CSGeometry(geofile)
    elif geotype == GeoType.Geom2D:
        geo = geom2d.SplineGeometry(geofile)
    mesh = geo.GenerateMesh(**{name: args[name] for name in args if args[name] is not None})
    if meshtype == MeshType.VOL:
        mesh.Save(meshfile)
    else:
        mesh.Export(meshfile, MeshType2Netgen[meshtype])


if __name__ == '__main__':
    main()
