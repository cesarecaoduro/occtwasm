#!/usr/bin/env bash
set -euo pipefail

# ---------------------------------------------------------------------------
# build-bindings.sh
#
# Compiles the embind C++ binding files into a WASM module, linking against
# the pre-built OCCT static libraries. The compilation runs inside Docker
# using the occtwasm-builder image.
#
# Produces:
#   build/dist/occt.js
#   build/dist/occt.wasm
# ---------------------------------------------------------------------------

# ── Variables ──────────────────────────────────────────────────────────────

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

DOCKER_IMAGE="occtwasm-builder"
OCCT_INSTALL="${PROJECT_ROOT}/build/occt-install"
BINDINGS_DIR="${PROJECT_ROOT}/bindings"
OUTPUT_DIR="${PROJECT_ROOT}/build/dist"

# ── Pre-checks ─────────────────────────────────────────────────────────────

echo "==> Verifying pre-built OCCT libraries..."

if [[ ! -f "${OCCT_INSTALL}/lib/libTKernel.a" ]]; then
    echo "ERROR: OCCT static libraries not found at ${OCCT_INSTALL}/lib/libTKernel.a"
    echo "       Please run ./scripts/build-wasm.sh first to build OCCT from source."
    exit 1
fi

echo "    Found OCCT install at ${OCCT_INSTALL}"

echo "==> Verifying binding source files..."

HAVE_BINDINGS=false
if [[ -d "${BINDINGS_DIR}/generated" ]]; then
    HAVE_BINDINGS=true
    echo "    Found bindings/generated/"
fi
if [[ -d "${BINDINGS_DIR}/manual" ]]; then
    HAVE_BINDINGS=true
    echo "    Found bindings/manual/"
fi

if [[ "${HAVE_BINDINGS}" != "true" ]]; then
    echo "ERROR: No binding sources found."
    echo "       Expected at least one of:"
    echo "         ${BINDINGS_DIR}/generated/"
    echo "         ${BINDINGS_DIR}/manual/"
    exit 1
fi

# ── Collect C++ sources ───────────────────────────────────────────────────

echo "==> Collecting C++ binding sources..."

CPP_FILES=()

if [[ -d "${BINDINGS_DIR}/generated" ]]; then
    while IFS= read -r -d '' f; do
        CPP_FILES+=("$f")
    done < <(find "${BINDINGS_DIR}/generated" -name '*.cpp' -print0 | sort -z)
fi

if [[ -d "${BINDINGS_DIR}/manual" ]]; then
    while IFS= read -r -d '' f; do
        CPP_FILES+=("$f")
    done < <(find "${BINDINGS_DIR}/manual" -name '*.cpp' -print0 | sort -z)
fi

if [[ ${#CPP_FILES[@]} -eq 0 ]]; then
    echo "ERROR: No .cpp files found in bindings/generated/ or bindings/manual/."
    exit 1
fi

echo "    Found ${#CPP_FILES[@]} source file(s):"
for f in "${CPP_FILES[@]}"; do
    echo "      - $(basename "$f")"
done

# ── Prepare output directory ──────────────────────────────────────────────

mkdir -p "${OUTPUT_DIR}"

# ── Build Docker source-path list ─────────────────────────────────────────
# Rewrite host paths to container paths (/src/...).

DOCKER_CPP_FILES=()
for f in "${CPP_FILES[@]}"; do
    DOCKER_CPP_FILES+=("/src/${f#"${PROJECT_ROOT}/"}")
done

# ── Run em++ inside Docker ────────────────────────────────────────────────

echo "==> Starting WASM compilation inside Docker (${DOCKER_IMAGE})..."
echo "    Output will be written to ${OUTPUT_DIR}/"

docker run --rm \
    -v "${PROJECT_ROOT}:/src" \
    -w /src \
    "${DOCKER_IMAGE}" \
    em++ \
        -O2 \
        --bind \
        -std=c++17 \
        -I/src/build/occt-install/include/opencascade \
        "${DOCKER_CPP_FILES[@]}" \
        -L/src/build/occt-install/lib \
        -lTKBRep \
        -lTKGeomBase \
        -lTKG3d \
        -lTKG2d \
        -lTKMath \
        -lTKernel \
        -s MODULARIZE=1 \
        -s EXPORT_ES6=1 \
        -s EXPORT_NAME="createOCCTModule" \
        -s ALLOW_MEMORY_GROWTH=1 \
        -s ENVIRONMENT='web,node' \
        -s FILESYSTEM=0 \
        -s SINGLE_FILE=0 \
        -o /src/build/dist/occt.js

# ── Post-build verification ──────────────────────────────────────────────

echo "==> Verifying build output..."

FAIL=false

if [[ ! -f "${OUTPUT_DIR}/occt.js" ]]; then
    echo "ERROR: ${OUTPUT_DIR}/occt.js was not created."
    FAIL=true
fi

if [[ ! -f "${OUTPUT_DIR}/occt.wasm" ]]; then
    echo "ERROR: ${OUTPUT_DIR}/occt.wasm was not created."
    FAIL=true
fi

if [[ "${FAIL}" == "true" ]]; then
    echo "Build failed — expected output files are missing."
    exit 1
fi

JS_SIZE=$(du -h "${OUTPUT_DIR}/occt.js" | cut -f1)
WASM_SIZE=$(du -h "${OUTPUT_DIR}/occt.wasm" | cut -f1)

echo "==> Build succeeded!"
echo "    occt.js   : ${OUTPUT_DIR}/occt.js  (${JS_SIZE})"
echo "    occt.wasm : ${OUTPUT_DIR}/occt.wasm (${WASM_SIZE})"
