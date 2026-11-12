#!/usr/bin/env bash
# unpack.sh <file.gpg> <dir>: decrypt (key in $RENDER_KEY) and extract a tar.gz into <dir>.
set -euo pipefail
[ -n "${RENDER_KEY:-}" ] || { echo "RENDER_KEY not set"; exit 1; }
mkdir -p "$2"
gpg --batch --quiet --pinentry-mode loopback --passphrase-fd 3 --decrypt "$1" 3<<<"$RENDER_KEY" | tar -xz -C "$2"
