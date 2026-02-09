# =============================================================================
# CMakeLists.txt  --  occtwasm-bindings
#
# Compiles the embind C++ bindings into a WebAssembly module, linking against
# pre-built OCCT static libraries.  This provides an alternative to the direct
# em++ invocation in build-bindings.sh, and is useful for IDE support and more
# complex builds.
#
# Usage (from inside the Emscripten Docker container):
#   mkdir -p build/cmake && cd build/cmake
#   emcmake cmake ../..
#   emmake make
# =============================================================================

cmake_minimum_required(VERSION 3.20)
project(occtwasm-bindings LANGUAGES CXX)

# ---------------------------------------------------------------------------
# C++ Standard
# ---------------------------------------------------------------------------
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# ---------------------------------------------------------------------------
# OCCT paths
# ---------------------------------------------------------------------------
set(OCCT_INSTALL_DIR "${CMAKE_SOURCE_DIR}/build/occt-install"
    CACHE PATH "Root of the pre-built OCCT installation")

set(OCCT_INCLUDE_DIR "${OCCT_INSTALL_DIR}/include/opencascade")
set(OCCT_LIB_DIR     "${OCCT_INSTALL_DIR}/lib")

# Sanity check -- give a clear error if the install directory is missing.
if(NOT EXISTS "${OCCT_INCLUDE_DIR}")
    message(FATAL_ERROR
        "OCCT include directory not found at ${OCCT_INCLUDE_DIR}\n"
        "Make sure OCCT has been built and installed (run `make build-occt`).\n"
        "You can override the path with -DOCCT_INSTALL_DIR=<path>.")
endif()

# ---------------------------------------------------------------------------
# Collect binding sources
# ---------------------------------------------------------------------------
file(GLOB_RECURSE GENERATED_SOURCES "${CMAKE_SOURCE_DIR}/bindings/generated/cpp/*.cpp")
file(GLOB_RECURSE MANUAL_SOURCES    "${CMAKE_SOURCE_DIR}/bindings/manual/cpp/*.cpp")

set(ALL_SOURCES ${GENERATED_SOURCES} ${MANUAL_SOURCES})

if(NOT ALL_SOURCES)
    message(FATAL_ERROR
        "No .cpp binding sources found in bindings/generated/ or bindings/manual/.\n"
        "Run code generation first (make codegen).")
endif()

# ---------------------------------------------------------------------------
# Executable target
#
# Emscripten produces a .js + .wasm pair from an executable target.
# ---------------------------------------------------------------------------
add_executable(occt ${ALL_SOURCES})

# ---------------------------------------------------------------------------
# Include directories
# ---------------------------------------------------------------------------
target_include_directories(occt PRIVATE "${OCCT_INCLUDE_DIR}")

# ---------------------------------------------------------------------------
# Find and link OCCT static libraries (in dependency order)
#
# The order matters: higher-level toolkits first, foundational ones last.
#   TKBRep      -> Boundary representation
#   TKGeomBase  -> Basic geometry
#   TKG3d       -> 3-D geometry
#   TKG2d       -> 2-D geometry
#   TKMath      -> Mathematics
#   TKernel     -> Kernel / foundation
# ---------------------------------------------------------------------------
set(OCCT_TOOLKIT_NAMES
    TKOffset
    TKBO
    TKBool
    TKShHealing
    TKTopAlgo
    TKGeomAlgo
    TKBRep
    TKGeomBase
    TKG3d
    TKG2d
    TKMath
    TKernel
)

set(OCCT_LIBRARIES "")

foreach(tk IN LISTS OCCT_TOOLKIT_NAMES)
    find_library(OCCT_LIB_${tk}
        NAMES ${tk}
        PATHS "${OCCT_LIB_DIR}"
        NO_DEFAULT_PATH
    )

    if(NOT OCCT_LIB_${tk})
        message(FATAL_ERROR
            "Could not find OCCT library '${tk}' in ${OCCT_LIB_DIR}.\n"
            "Make sure OCCT has been built and installed.")
    endif()

    list(APPEND OCCT_LIBRARIES "${OCCT_LIB_${tk}}")
    message(STATUS "Found OCCT lib: ${OCCT_LIB_${tk}}")
endforeach()

target_link_libraries(occt PRIVATE ${OCCT_LIBRARIES})

# ---------------------------------------------------------------------------
# Emscripten link flags
# ---------------------------------------------------------------------------
target_link_options(occt PRIVATE
    "SHELL:--bind"
    "SHELL:-s MODULARIZE=1"
    "SHELL:-s EXPORT_ES6=1"
    "SHELL:-s EXPORT_NAME=\"createOCCTModule\""
    "SHELL:-s ALLOW_MEMORY_GROWTH=1"
    "SHELL:-s ENVIRONMENT='web,node'"
    "SHELL:-s FILESYSTEM=0"
)

# ---------------------------------------------------------------------------
# Output configuration
# ---------------------------------------------------------------------------
set(DIST_DIR "${CMAKE_SOURCE_DIR}/build/dist")

set_target_properties(occt PROPERTIES
    OUTPUT_NAME             "occt"
    RUNTIME_OUTPUT_DIRECTORY "${DIST_DIR}"
)

# ---------------------------------------------------------------------------
# Install rule  --  copy the .js and .wasm artefacts to build/dist
# ---------------------------------------------------------------------------
install(
    FILES
        "${DIST_DIR}/occt.js"
        "${DIST_DIR}/occt.wasm"
    DESTINATION "${DIST_DIR}"
)
