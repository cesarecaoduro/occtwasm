#!/usr/bin/env bash
set -euo pipefail

# ---------------------------------------------------------------------------
# download-occt.sh
#
# Downloads the OpenCascade (OCCT) source code from GitHub and extracts it
# into build/occt-source/.  The tag can be overridden with the OCCT_TAG
# environment variable.
# ---------------------------------------------------------------------------

OCCT_TAG="${OCCT_TAG:-V8_0_0_rc3}"

# Resolve the project root (one directory above this script).
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

SOURCE_DIR="${PROJECT_ROOT}/build/occt-source"
STAMP_FILE="${PROJECT_ROOT}/.occt-version"
DOWNLOAD_URL="https://github.com/Open-Cascade-SAS/OCCT/archive/refs/tags/${OCCT_TAG}.tar.gz"

# ------------------------------------------------------------------
# Skip if already downloaded
# ------------------------------------------------------------------
if [[ -f "${STAMP_FILE}" ]] && [[ "$(cat "${STAMP_FILE}")" == "${OCCT_TAG}" ]]; then
    echo "OCCT ${OCCT_TAG} is already downloaded — skipping."
    exit 0
fi

# ------------------------------------------------------------------
# Download
# ------------------------------------------------------------------
echo "Downloading OCCT ${OCCT_TAG}..."
TMPFILE="$(mktemp "${TMPDIR:-/tmp}/occt-XXXXXXXXXX.tar.gz")"

cleanup() {
    if [[ -f "${TMPFILE}" ]]; then
        rm -f "${TMPFILE}"
    fi
}
trap cleanup EXIT

curl -fSL --retry 3 --retry-delay 5 -o "${TMPFILE}" "${DOWNLOAD_URL}"

# ------------------------------------------------------------------
# Extract
# ------------------------------------------------------------------
echo "Extracting..."

# Remove any previous source tree so we start clean.
if [[ -d "${SOURCE_DIR}" ]]; then
    rm -rf "${SOURCE_DIR}"
fi
mkdir -p "${SOURCE_DIR}"

# GitHub tarballs extract into a directory named OCCT-<tag>/.
# We strip that leading component so files land directly in occt-source/.
tar xzf "${TMPFILE}" -C "${SOURCE_DIR}" --strip-components=1

# ------------------------------------------------------------------
# Stamp & cleanup
# ------------------------------------------------------------------
echo "${OCCT_TAG}" > "${STAMP_FILE}"

# The trap handles tarball removal, but we can be explicit too.
rm -f "${TMPFILE}"

echo "Done. OCCT ${OCCT_TAG} source is in ${SOURCE_DIR}"
