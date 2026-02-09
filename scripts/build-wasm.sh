#!/usr/bin/env bash
set -euo pipefail

# ---------------------------------------------------------------------------
# build-wasm.sh
#
# Builds OpenCascade (OCCT) from source into static WebAssembly libraries
# using Docker + Emscripten.  The Docker image can be overridden with the
# DOCKER_IMAGE environment variable.
#
# Prerequisites:
#   - Docker must be installed and running.
#   - OCCT source must already be downloaded (run download-occt.sh first).
# ---------------------------------------------------------------------------

# Resolve the project root (one directory above this script).
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

DOCKER_IMAGE="${DOCKER_IMAGE:-occtwasm-builder}"
BUILD_DIR="${PROJECT_ROOT}/build/occt-wasm"
OCCT_SOURCE="${PROJECT_ROOT}/build/occt-source"
INSTALL_DIR="${PROJECT_ROOT}/build/occt-install"

# ------------------------------------------------------------------
# Pre-checks
# ------------------------------------------------------------------

echo "==> Checking prerequisites..."

if [[ ! -d "${OCCT_SOURCE}" ]]; then
    echo "ERROR: OCCT source directory not found at ${OCCT_SOURCE}" >&2
    echo "       Run scripts/download-occt.sh first to download the OCCT source." >&2
    exit 1
fi

if ! command -v docker &>/dev/null; then
    echo "ERROR: Docker is not installed or not in PATH." >&2
    echo "       Please install Docker and try again." >&2
    exit 1
fi

if ! docker info &>/dev/null; then
    echo "ERROR: Docker daemon is not running." >&2
    echo "       Please start Docker and try again." >&2
    exit 1
fi

echo "    OCCT source found at ${OCCT_SOURCE}"
echo "    Docker is available"
echo "    Using Docker image: ${DOCKER_IMAGE}"

# ------------------------------------------------------------------
# Build OCCT inside Docker with Emscripten
# ------------------------------------------------------------------

echo ""
echo "==> Starting OCCT WebAssembly build inside Docker..."
echo "    Build directory:   ${BUILD_DIR}"
echo "    Install directory: ${INSTALL_DIR}"
echo ""

docker run --rm \
    -v "${PROJECT_ROOT}:/src" \
    -w /src \
    "${DOCKER_IMAGE}" \
    bash -c '
set -euo pipefail

echo "--- Creating build directory ---"
mkdir -p /src/build/occt-wasm
cd /src/build/occt-wasm

echo "--- Running emcmake cmake ---"
emcmake cmake /src/build/occt-source \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/src/build/occt-install \
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

echo ""
echo "--- Running emmake make ---"
emmake make -j$(nproc)

echo ""
echo "--- Running make install ---"
make install

echo ""
echo "--- Build and install completed inside Docker ---"
'

# ------------------------------------------------------------------
# Post-build verification
# ------------------------------------------------------------------

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
