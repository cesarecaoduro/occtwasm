# @occtwasm/core

OpenCascade (OCCT 8.0.0) compiled to WebAssembly with TypeScript bindings.

## Architecture

```
C++ OCCT Libraries (.a)
        |
  [embind C++ layer]        <- disambiguated names (e.g. Mirror_Pnt, Mirror_Ax1)
  (generated/ + manual/)      generated from YAML configs + parsed headers
        |
    WASM Module (.wasm + .js glue)
        |
  [TypeScript wrapper layer] <- proper overloads with instanceof dispatch
  (generated/ + manual/)      generated TS wrappers + module loader / types
        |
    NPM Package (@occtwasm/core)
```

**Why two layers?** Emscripten's embind only supports overloading by argument *count*, while OCCT heavily overloads by *type* (e.g. `gp_Trsf::SetMirror(gp_Pnt)` vs `SetMirror(gp_Ax1)` vs `SetMirror(gp_Ax2)`). The C++ layer disambiguates with suffixed names; the TypeScript layer restores the original API with runtime `instanceof` dispatch.

**Why manual helpers?** Three codegen limitations require hand-written C++ embind wrappers:
1. **Handle types** -- `GC_MakeArcOfCircle` returns `Handle(Geom_TrimmedCurve)` which embind can't bind directly
2. **Virtual methods** -- `Shape()`, `Build()`, `IsDone()` are virtual and skipped by the parser
3. **Abstract base classes** -- `GCPnts_AbscissaPoint` takes `Adaptor3d_Curve&` (abstract); manual wrappers accept the concrete `TopoDS_Edge` instead

## Quick Start

```typescript
import { initOCCT } from '@occtwasm/core';
import { gp_Pnt } from '@occtwasm/core/TKMath';
import { BRepBuilderAPI_MakeEdge, BRepBuilderAPI_MakeWire } from '@occtwasm/core/TKTopAlgo';
import { edgeLength, makeArcEdge3d, wireLength } from '@occtwasm/core/helpers';

await initOCCT();

// Create an edge between 2 points
const p1 = new gp_Pnt(0, 0, 0);
const p2 = new gp_Pnt(10, 0, 0);
const maker = new BRepBuilderAPI_MakeEdge(p1, p2);
const edge = maker.Edge();
console.log(edgeLength(edge)); // 10.0

// Create an arc through 3 points
const a1 = new gp_Pnt(10, 0, 0);
const a2 = new gp_Pnt(0, 10, 0);
const a3 = new gp_Pnt(-10, 0, 0);
const arc = makeArcEdge3d(a1, a2, a3);
console.log(edgeLength(arc)); // ~31.42 (pi * 10)

// Build a wire from edges
const wire = new BRepBuilderAPI_MakeWire(edge, arc);
console.log(wireLength(wire.Wire())); // ~41.42
```

## Live Viewer

A Three.js-powered 3D viewer demonstrates the library's geometry operations interactively. It renders points and wires (edges, arcs, polylines, composite wires) directly from OCCT shapes -- no tessellation needed.

**Demos included:** Edge (line), Arc (3-point), Polyline, Wire (line+arc+line), Loft Profiles, Wire Intersection.

```bash
cd examples/viewer
npm install
npm run dev
# Open http://localhost:5173
```

Use the sidebar to switch between demos. Rotate (left drag), pan (right drag), and zoom (scroll) with OrbitControls.

## Module Initialization

All generated bindings resolve the active Emscripten module from `initOCCT()`.
Call `initOCCT()` once before using any bindings:

```ts
import { initOCCT } from '@occtwasm/core';
await initOCCT();
```

If you host the WASM on a CDN, pass `locateFile`:

```ts
await initOCCT({
  locateFile: (path) => `https://cdn.example.com/wasm/${path}`,
});
```

## Memory Management

Embind objects are manual‑lifetime. Call `.delete()` on objects you create:

```ts
const p = new gp_Pnt(1, 2, 3);
// ...
p.delete();
```

## Building from Source

### Prerequisites

- [Emscripten](https://emscripten.org/) (locally installed, e.g. `brew install emscripten`)
- Node.js >= 18
- CMake

### Build Steps

```bash
npm install          # Install TS dependencies
make init-submodule  # Initialize OCCT git submodule
make build-occt      # Build OCCT static libs (Emscripten)
make codegen         # Generate embind C++ and TS wrappers
make build-bindings  # Compile WASM module
npm run build        # Build TypeScript package
npm test             # Run tests
```

## How Codegen Works

The codegen pipeline has three stages:

1. **Minimal YAML configs** (`codegen/config/*.yaml`) declare which OCCT classes/methods/enums to bind. Humans only specify overload disambiguation (match arrays + suffixes), factory constructors, output args, and skip lists.

2. **Header parsing** (`parse-headers.ts`) reads the actual OCCT `.hxx` headers to extract constructors, methods, args, return types, and inheritance.

3. **Merge** (`merge-config.ts`) combines the YAML config with parsed header data to produce a fully-resolved `ModuleConfig`, then emitters generate C++ embind code and TypeScript wrappers.

To scaffold YAML for a new class:
```bash
npx tsx codegen/src/generate-yaml.ts --classes gp_Pnt,gp_Vec --module TKMath
```

## Project Structure

```
extern/occt/                     # OCCT source (git submodule, V8_0_0_rc3)
scripts/                         # Build scripts (local Emscripten)
codegen/
  config/                        # Per-toolkit YAML configs
    modules.yaml                 #   Module registry (which toolkits to build)
    TKMath.yaml                  #   gp_* geometry classes (3D + 2D)
    TKBRep.yaml                  #   TopoDS/BRep topology classes
    TKTopAlgo.yaml               #   BRepBuilderAPI_Make* builder classes
    TKGeomBase.yaml              #   gce_Make* geometry construction classes
  src/                           # Codegen tool source
    codegen.ts                   #   Entry point
    parse-headers.ts             #   OCCT .hxx header parser
    parse-config.ts              #   YAML config loader + resolved types
    merge-config.ts              #   Merge YAML config with parsed headers
    emit-embind.ts               #   Generate C++ embind bindings
    emit-typescript.ts           #   Generate TypeScript wrappers
    type-mapper.ts               #   C++ <-> TS/embind type mapping
    overload-resolver.ts         #   Runtime overload dispatch codegen
    generate-yaml.ts             #   CLI tool to scaffold new YAML configs
bindings/
  generated/                     # Auto-generated by `make codegen` -- DO NOT EDIT
    cpp/                         #   embind C++ (one file per OCCT toolkit)
      TKMath.cpp
      TKBRep.cpp
      TKTopAlgo.cpp
      TKGeomBase.cpp
    ts/                          #   TypeScript wrappers with runtime overload dispatch
      TKMath.ts
      TKBRep.ts
      TKTopAlgo.ts
      TKGeomBase.ts
  manual/                        # Hand-written code -- never overwritten by codegen
    cpp/
      occt_wasm_init.cpp         #   Module-level init
      cast_helpers.cpp           #   TopoDS downcasting helpers
      arc_helpers.cpp            #   Arc edge from 3 points (wraps Handle types)
      curve_measure_helpers.cpp  #   Edge/wire length, point at length
      gprop_helpers.cpp          #   GProp_GProps, BRepGProp surface/volume properties
      boolean_helpers.cpp        #   BRepAlgoAPI_Section (wire intersection)
      loft_helpers.cpp           #   BRepOffsetAPI_ThruSections (lofting)
    ts/
      types.ts                   #   OcctModule interface, InitOptions
      module-loader.ts           #   Async initOCCT() singleton WASM loader
      helpers.ts                 #   TS wrappers for manual C++ helpers
tests/                           # Vitest test suite
  edge.test.ts                   #   Edge creation (3D + 2D), length, point at length
  arc.test.ts                    #   Arc from 3 points (3D + 2D), length, point at length
  polyline.test.ts               #   Polyline from N points, length, point at length
  wire.test.ts                   #   Wire from line+arc+polyline, length, point at length
  intersection.test.ts           #   Wire-wire intersection
  loft.test.ts                   #   Loft (surface area, volume)
examples/
  viewer/                        # Three.js 3D viewer (Vite dev server)
    src/
      main.ts                    #   App entry: Three.js scene + OrbitControls + demo switcher
      occt-to-three.ts           #   OCCT edge/wire → Three.js Line/Points conversion
      demos/                     #   One file per demo (edge, arc, polyline, wire, loft, intersection)
build/                           # Build artefacts (gitignored)
  occt-install/                  #   Pre-built OCCT static libraries + headers
  dist/                          #   occt.js + occt.wasm output
```

## Bound Classes

### Generated (codegen)

~45 classes from 4 OCCT toolkits:

- **TKMath (gp)**: XYZ, Pnt, Vec, Dir, Ax1, Ax2, Ax3, Trsf, Mat, Quaternion, Lin, Pln, Circ, Elips, XY, Pnt2d, Vec2d, Dir2d, Ax2d, Ax22d, Lin2d, Circ2d
- **TKBRep (TopoDS/BRep)**: Shape, Vertex, Edge, Wire, Face, Shell, Solid, Compound, Builder, Iterator, TopExp_Explorer, BRep_Builder, BRep_Tool
- **TKTopAlgo**: BRepBuilderAPI_MakeEdge, MakeEdge2d, MakeWire, MakePolygon
- **TKGeomBase**: gce_MakeCirc, gce_MakeCirc2d, gce_MakeLin, gce_MakeLin2d
- **Enums**: gp_TrsfForm, gp_EulerSequence, TopAbs_ShapeEnum, TopAbs_Orientation, TopAbs_State, BRepBuilderAPI_EdgeError, BRepBuilderAPI_WireError, gce_ErrorType

### Manual C++ Helpers

For operations blocked by Handle types, virtual methods, or abstract base classes:

- **Arc creation**: `MakeArcEdge3d(P1, P2, P3)`, `MakeArcEdge2d(P1, P2, P3)`
- **Curve measurement**: `EdgeLength`, `WireLength`, `PointAtLengthOnEdge`, `PointAtLengthOnWire`
- **Global properties**: `BRepGProp_LinearProperties`, `BRepGProp_SurfaceProperties`, `BRepGProp_VolumeProperties` + `GProp_GProps`
- **Boolean operations**: `BRepAlgoAPI_Section` (shape intersection)
- **Lofting**: `BRepOffsetAPI_ThruSections` (surface/solid through wire sections)
- **Builder helpers**: `Shape()`, `IsDone()` for all `BRepBuilderAPI_Make*` classes
- **Cast helpers**: `TopoDS_ToVertex`, `TopoDS_ToEdge`, `TopoDS_ToWire`, etc.

### OCCT Libraries Linked

12 static libraries in dependency order:
```
TKOffset > TKBO > TKBool > TKShHealing > TKTopAlgo > TKGeomAlgo >
TKBRep > TKGeomBase > TKG3d > TKG2d > TKMath > TKernel
```

## License

LGPL-2.1 (same as OCCT)
