#!/usr/bin/env bash
set -euo pipefail

REPO="cesarecaoduro/occtwasm"

AUTH_HEADER=()
if [ -n "${GITHUB_TOKEN:-}" ]; then
  AUTH_HEADER=(-H "Authorization: Bearer ${GITHUB_TOKEN}")
elif [ -n "${GH_TOKEN:-}" ]; then
  AUTH_HEADER=(-H "Authorization: Bearer ${GH_TOKEN}")
fi

# Fetches $1 into file $2, retrying on transient failures / GitHub API rate limits.
fetch_with_retry() {
  local url="$1" out="$2" attempt http_code
  for attempt in 1 2 3; do
    http_code=$(curl -sS -L "${AUTH_HEADER[@]}" -w '%{http_code}' -o "$out" "$url" || echo "000")
    if [ "$http_code" = "200" ]; then
      return 0
    fi
    echo "    Attempt $attempt/3 failed for $url (HTTP $http_code)" >&2
    if [ "$http_code" = "403" ] || [ "$http_code" = "429" ]; then
      echo "    This looks like a GitHub API rate limit (unauthenticated requests are capped at 60/hour per IP)." >&2
      echo "    Set a GITHUB_TOKEN env var on the Vercel project to raise the limit to 5000/hour." >&2
    fi
    if [ "$attempt" -lt 3 ]; then
      sleep $((attempt * 5))
    fi
  done
  echo "ERROR: Failed to fetch $url after 3 attempts (last HTTP $http_code)." >&2
  return 1
}

echo "==> Fetching latest release tag..."
fetch_with_retry "https://api.github.com/repos/$REPO/releases/latest" /tmp/release.json
TAG=$(node -e "console.log(JSON.parse(require('fs').readFileSync('/tmp/release.json','utf8')).tag_name || '')")

if [ -z "$TAG" ]; then
  echo "ERROR: Could not determine latest release tag. Response was:" >&2
  cat /tmp/release.json >&2
  exit 1
fi
echo "    Latest release: $TAG"

echo "==> Downloading dist.tar.gz from release $TAG..."
fetch_with_retry "https://github.com/$REPO/releases/download/$TAG/dist.tar.gz" /tmp/dist.tar.gz

echo "==> Extracting pre-built dist/ to project root..."
tar xzf /tmp/dist.tar.gz

echo "==> Installing viewer dependencies..."
cd examples/viewer
npm install --prefer-offline

echo "==> Building viewer with Vite..."
npx vite build

echo "==> Vercel build complete. Output in examples/viewer/dist/"
