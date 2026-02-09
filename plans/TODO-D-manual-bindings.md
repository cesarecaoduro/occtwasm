# Phase D: Manual Binding Helpers

- [ ] Create bindings/manual/cpp/occt_wasm_init.cpp (Emscripten module init)
- [ ] Create bindings/manual/cpp/cast_helpers.cpp
  - [ ] TopoDS_ToVertex, TopoDS_ToEdge, TopoDS_ToWire, TopoDS_ToFace
  - [ ] TopoDS_ToShell, TopoDS_ToSolid, TopoDS_ToCompSolid, TopoDS_ToCompound
- [ ] Create bindings/manual/ts/module-loader.ts
  - [ ] Async initOCCT() function
  - [ ] Browser vs Node.js auto-detection for WASM loading
- [ ] Create bindings/manual/ts/types.ts
  - [ ] OcctModule interface
  - [ ] Shared type definitions
