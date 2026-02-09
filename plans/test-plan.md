I want to implement the following test and implement the features that are required to complete these tests.

- [x] create an edge between 2 points
- [x] create an edge between 2 points and calculate the length
- [x] create an edge between 2 points and calculate a point at a certain length

- [x] create an arc between 3 points
- [x] create an arc between 3 points and calculate the length
- [x] create an arc between 3 points and calculate a point at a certain length
- [x] convert the arc to an edge

- [x] create a polyline between 5 points
- [x] create a polyline between 5 points and calculate the length
- [x] create a polyline between 5 points and calculate a point at a certain length
- [x] convert the polyline to a wire

- [x] create a wire with a combination of: line, arc, polyline
- [x] create a wire with a combination of: line, arc, polyline and calculate the length
- [x] create a wire with a combination of: line, arc, polyline and calculate a point at a certain length

- [x] intersect 2 wires and extract the point/s

- [x] create a loft based on opened wires
- [x] create a loft based on opened wires and calculate the surface
- [x] create a loft based on closed wires
- [x] create a loft based on closed wires and calculate the volume

## Implementation Status

All features implemented. Tests require WASM compilation (`make build-bindings`) to run.

### Test Files

| Test file | Coverage |
|---|---|
| `tests/edge.test.ts` | Edge creation (3D + 2D), length, point at length |
| `tests/arc.test.ts` | Arc from 3 points (3D + 2D), length, point at length |
| `tests/polyline.test.ts` | Polyline from 5 points, length, point at length, wire conversion |
| `tests/wire.test.ts` | Wire from line+arc+polyline, length, point at length |
| `tests/intersection.test.ts` | Wire-wire intersection, vertex extraction |
| `tests/loft.test.ts` | Loft from open wires (surface area), closed wires (volume) |

### Bound Classes & Helpers

**Generated via codegen (YAML configs):**
- `TKTopAlgo`: `BRepBuilderAPI_MakeEdge`, `MakeEdge2d`, `MakeWire`, `MakePolygon` + enums
- `TKGeomBase`: `gce_MakeCirc`, `gce_MakeCirc2d`, `gce_MakeLin`, `gce_MakeLin2d` + enum
- `TKMath` (extended): `gp_XY`, `gp_Pnt2d`, `gp_Vec2d`, `gp_Dir2d`, `gp_Ax2d`, `gp_Ax22d`, `gp_Lin2d`, `gp_Circ2d`

**Manual C++ embind helpers** (for Handle types, virtual methods, abstract base classes):
- `arc_helpers.cpp` -- `MakeArcEdge3d/2d` (wraps gce_MakeCirc + BRepBuilderAPI_MakeEdge)
- `curve_measure_helpers.cpp` -- `EdgeLength`, `WireLength`, `PointAtLengthOnEdge/Wire` (wraps BRepAdaptor_Curve + GCPnts_AbscissaPoint)
- `gprop_helpers.cpp` -- `GProp_GProps`, `BRepGProp_LinearProperties/SurfaceProperties/VolumeProperties`
- `boolean_helpers.cpp` -- `BRepAlgoAPI_Section` (wire intersection)
- `loft_helpers.cpp` -- `BRepOffsetAPI_ThruSections` (lofting)
