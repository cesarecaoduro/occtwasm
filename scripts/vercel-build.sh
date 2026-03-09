#!/usr/bin/env bash
set -euo pipefail

REPO="cesarecaoduro/occtwasm"

echo "==> Fetching latest release tag..."
TAG=$(curl -sf "https://api.github.com/repos/$REPO/releases/latest" \
  | node -e "let d='';process.stdin.on('data',c=>d+=c);process.stdin.on('end',()=>console.log(JSON.parse(d).tag_name))")

if [ -z "$TAG" ]; then
  echo "ERROR: Could not determine latest release tag."
  exit 1
fi
echo "    Latest release: $TAG"

echo "==> Downloading dist.tar.gz from release $TAG..."
curl -sfL "https://github.com/$REPO/releases/download/$TAG/dist.tar.gz" -o /tmp/dist.tar.gz

echo "==> Extracting pre-built dist/ to project root..."
tar xzf /tmp/dist.tar.gz

echo "==> Installing viewer dependencies..."
cd examples/viewer
npm install --prefer-offline

echo "==> Building viewer with Vite..."
npx vite build

echo "==> Vercel build complete. Output in examples/viewer/dist/"
