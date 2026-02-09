# Plan: Build OCCT to WebAssembly with TypeScript Bindings

## Overview

Build OpenCascade (OCCT V8_0_0_rc3) from source to WebAssembly using Emscripten, with a TypeScript wrapper layer providing proper method overloads (1-1 name matching), packaged as an NPM module for both browser and Node.js.

**Initial scope**: gp primitives + TopoDS types (~25 classes). Designed to scale to the full library (~1400+ classes).

## Architecture: Two-Layer Binding

```
C++ OCCT Libraries (.a)
        |
  [embind C++ layer]  -- disambiguated internal names (e.g. Mirror_Pnt, Mirror_Ax1)
        |
    WASM Module (.wasm + .js glue)
        |
  [TypeScript wrapper layer]  -- proper overloads with instanceof dispatch
        |
    NPM Package (@occtwasm/core)
```

**Why two layers?** embind only supports overloading by argument *count*, not *type*. OCCT heavily overloads by type (e.g. `gp_Trsf::SetMirror(gp_Pnt)`, `SetMirror(gp_Ax1)`, `SetMirror(gp_Ax2)`). The TS layer adds runtime `instanceof` dispatch to route to the correct disambiguated embind function.

## Phases

| Phase | Description | Key Deliverables |
|-------|-------------|-----------------|
| **A** | Project scaffolding | package.json, tsconfig.json, Makefile, Dockerfile |
| **B** | Download + build scripts | download-occt.sh, build-wasm.sh, build-bindings.sh, CMakeLists.txt |
| **C** | Codegen config + tool | YAML configs, codegen TypeScript tool |
| **D** | Manual binding helpers | cast_helpers.cpp, module-loader.ts, types.ts |
| **E** | Run codegen + compile WASM | Generated C++/TS files, occt.wasm |
| **F** | NPM entry point + TS build | src/index.ts, dist/ output |
| **G** | Tests | vitest test suite |

## Initial Scope (~25 classes)

### gp primitives (TKMath)
gp_XYZ, gp_Pnt, gp_Vec, gp_Dir, gp_Ax1, gp_Ax2, gp_Ax3, gp_Trsf, gp_Mat, gp_Quaternion, gp_Lin, gp_Pln, gp_Circ, gp_Elips

### Enums
gp_TrsfForm, gp_EulerSequence, TopAbs_ShapeEnum, TopAbs_Orientation, TopAbs_State

### TopoDS types (TKBRep)
TopoDS_Shape, TopoDS_Vertex, TopoDS_Edge, TopoDS_Wire, TopoDS_Face, TopoDS_Shell, TopoDS_Solid, TopoDS_Compound, TopoDS_Builder, TopoDS_Iterator, TopExp_Explorer, BRep_Builder, BRep_Tool

### Static casting helpers
TopoDS.ToVertex, TopoDS.ToEdge, ..., TopoDS.ToCompound
