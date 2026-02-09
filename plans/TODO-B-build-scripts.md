# Phase B: Download + Build Scripts

- [ ] Create scripts/download-occt.sh
  - [ ] Download OCCT V8_0_0_rc3 tarball from GitHub
  - [ ] Extract to build/occt-source/
  - [ ] Support OCCT_TAG env var override
  - [ ] Write .occt-version stamp file
- [ ] Create scripts/build-wasm.sh
  - [ ] Docker-based CMake + Emscripten build
  - [ ] Disable Draw, Visualization, ApplicationFramework, DataExchange modules
  - [ ] Enable FoundationClasses, ModelingData
  - [ ] Disable FreeType, Tk, Tcl, OpenGL, GLES2, FreeImage
  - [ ] Produce static .a libs (TKernel, TKMath, TKG2d, TKG3d, TKGeomBase, TKBRep)
- [ ] Create scripts/build-bindings.sh
  - [ ] Link generated + manual C++ with OCCT static libs
  - [ ] em++ with --bind, MODULARIZE, EXPORT_ES6, ALLOW_MEMORY_GROWTH
  - [ ] Output build/dist/occt.js + occt.wasm
- [ ] Create CMakeLists.txt for binding compilation
