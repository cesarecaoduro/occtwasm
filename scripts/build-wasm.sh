#!/usr/bin/env bash
set -euo pipefail

# ---------------------------------------------------------------------------
# build-wasm.sh
#
# Builds OpenCascade (OCCT) from source into static WebAssembly libraries
# using a locally-installed Emscripten toolchain.
#
# Prerequisites:
#   - Emscripten must be installed (emcmake and emmake on PATH).
#     On macOS: brew install emscripten
#   - OCCT source must be present at extern/occt/ (git submodule).
#     Run: git submodule update --init --recursive
# ---------------------------------------------------------------------------

# ── Resolve paths ─────────────────────────────────────────────────────────

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

OCCT_SOURCE="${PROJECT_ROOT}/extern/occt"
BUILD_DIR="${PROJECT_ROOT}/build/occt-wasm"
INSTALL_DIR="${PROJECT_ROOT}/build/occt-install"

# ── Pre-checks ────────────────────────────────────────────────────────────

echo "==> Checking prerequisites..."

# Verify Emscripten is available
if ! command -v emcmake &>/dev/null; then
    echo "ERROR: emcmake is not installed or not in PATH." >&2
    echo "       Install Emscripten (e.g. brew install emscripten) and try again." >&2
    exit 1
fi

if ! command -v emmake &>/dev/null; then
    echo "ERROR: emmake is not installed or not in PATH." >&2
    echo "       Install Emscripten (e.g. brew install emscripten) and try again." >&2
    exit 1
fi

# Verify OCCT source is present
if [[ ! -d "${OCCT_SOURCE}" ]] || [[ ! -f "${OCCT_SOURCE}/CMakeLists.txt" ]]; then
    echo "ERROR: OCCT source directory not found at ${OCCT_SOURCE}" >&2
    echo "       Run: git submodule update --init --recursive" >&2
    exit 1
fi

echo "    OCCT source found at ${OCCT_SOURCE}"
echo "    emcmake: $(command -v emcmake)"
echo "    emmake:  $(command -v emmake)"

# ── Build OCCT with Emscripten ────────────────────────────────────────────

echo ""
echo "==> Starting OCCT WebAssembly build..."
echo "    Build directory:   ${BUILD_DIR}"
echo "    Install directory: ${INSTALL_DIR}"
echo ""

mkdir -p "${BUILD_DIR}"
cd "${BUILD_DIR}"

# Configure with emcmake
echo "--- Running emcmake cmake ---"
emcmake cmake "${OCCT_SOURCE}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="${INSTALL_DIR}" \
    -DBUILD_LIBRARY_TYPE=Static \
    \
    -DBUILD_MODULE_FoundationClasses=ON \
    -DBUILD_MODULE_ModelingData=ON \
    -DBUILD_MODULE_ModelingAlgorithms=ON \
    \
    -DBUILD_MODULE_Draw=OFF \
    -DBUILD_MODULE_Visualization=OFF \
    -DBUILD_MODULE_ApplicationFramework=OFF \
    -DBUILD_MODULE_DataExchange=OFF \
    -DBUILD_MODULE_DETools=OFF \
    \
    -DUSE_FREETYPE=OFF \
    -DUSE_TK=OFF \
    -DUSE_TCL=OFF \
    -DUSE_OPENGL=OFF \
    -DUSE_GLES2=OFF \
    -DUSE_FREEIMAGE=OFF \
    -DUSE_RAPIDJSON=OFF \
    -DUSE_DRACO=OFF \
    -DUSE_TBB=OFF \
    -DUSE_VTK=OFF \
    -DUSE_FFMPEG=OFF \
    -DUSE_OPENVR=OFF \
    \
    -DBUILD_DOC_Overview=OFF

# Build with emmake
echo ""
echo "--- Running emmake make ---"
NPROC=$(sysctl -n hw.logicalcpu 2>/dev/null || nproc 2>/dev/null || echo 4)
emmake make -j"${NPROC}"

# Install
echo ""
echo "--- Running make install ---"
make install

echo ""
echo "--- Build and install completed ---"

# ── Post-build verification ───────────────────────────────────────────────

echo ""
echo "==> Verifying build output..."

REQUIRED_LIBS=(
    "libTKernel.a"
    "libTKMath.a"
    "libTKBRep.a"
)

LIB_DIR="${INSTALL_DIR}/lib"
ALL_FOUND=true

for lib in "${REQUIRED_LIBS[@]}"; do
    if [[ -f "${LIB_DIR}/${lib}" ]]; then
        echo "    OK: ${lib}"
    else
        echo "    MISSING: ${lib}" >&2
        ALL_FOUND=false
    fi
done

echo ""

if [[ "${ALL_FOUND}" == true ]]; then
    echo "==> SUCCESS: OCCT WebAssembly static libraries built and installed."
    echo "    Install prefix: ${INSTALL_DIR}"
else
    echo "ERROR: One or more required libraries were not found in ${LIB_DIR}" >&2
    echo "       The build may have failed or installed to an unexpected location." >&2
    exit 1
fi
