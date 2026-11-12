#!/usr/bin/env bash
# pack.sh <dir> <file.gpg>: tar.gz a directory and encrypt it (AES-256, key in $RENDER_KEY).
set -euo pipefail
[ -n "${RENDER_KEY:-}" ] || { echo "RENDER_KEY not set"; exit 1; }
mkdir -p "$1"
tar -cz -C "$1" . | gpg --batch --quiet --pinentry-mode loopback --passphrase-fd 3 \
  --symmetric --cipher-algo AES256 --compress-algo none -o "$2" 3<<<"$RENDER_KEY"
