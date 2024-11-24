#!/bin/bash
set -ex -o pipefail

BASE=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
NODE_BIN="${BASE}/node_modules/.bin"
TW_BIN="${NODE_BIN}/tailwindcss"

mkdir -p $NODE_BIN

TAILWIND_BUILD="tailwindcss-linux-x64"
TAILWIND_VER="latest"

curl -sL "https://github.com/tailwindlabs/tailwindcss/releases/${TAILWIND_VER}/download/${TAILWIND_BUILD}" -o ${TW_BIN}
chmod +x ${TW_BIN}

