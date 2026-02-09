# Phase B: Download + Build Scripts

- [x] Create scripts/download-occt.sh
  - [x] Download OCCT V8_0_0_rc3 tarball from GitHub
  - [x] Extract to build/occt-source/
  - [x] Support OCCT_TAG env var override
  - [x] Write .occt-version stamp file
- [x] Create scripts/build-wasm.sh
  - [x] Docker-based CMake + Emscripten build
  - [x] Disable Draw, Visualization, ApplicationFramework, DataExchange modules
  - [x] Enable FoundationClasses, ModelingData
  - [x] Disable FreeType, Tk, Tcl, OpenGL, GLES2, FreeImage
  - [x] Produce static .a libs (TKernel, TKMath, TKG2d, TKG3d, TKGeomBase, TKBRep)
- [x] Create scripts/build-bindings.sh
  - [x] Link generated + manual C++ with OCCT static libs
  - [x] em++ with --bind, MODULARIZE, EXPORT_ES6, ALLOW_MEMORY_GROWTH
  - [x] Output build/dist/occt.js + occt.wasm
- [x] Create CMakeLists.txt for binding compilation
