# Phase D: Manual Binding Helpers

- [x] Create bindings/manual/cpp/occt_wasm_init.cpp (Emscripten module init)
- [x] Create bindings/manual/cpp/cast_helpers.cpp
  - [x] TopoDS_ToVertex, TopoDS_ToEdge, TopoDS_ToWire, TopoDS_ToFace
  - [x] TopoDS_ToShell, TopoDS_ToSolid, TopoDS_ToCompSolid, TopoDS_ToCompound
- [x] Create bindings/manual/ts/module-loader.ts
  - [x] Async initOCCT() function
  - [x] Browser vs Node.js auto-detection for WASM loading
- [x] Create bindings/manual/ts/types.ts
  - [x] OcctModule interface
  - [x] Shared type definitions
