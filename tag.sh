#!/bin/sh
set -euo pipefail

JSON=$(curl -fsSL "https://api.github.com/repos/fatedier/frp/releases/latest")
VER=$(printf "%s" "$JSON" | jq -r ".tag_name")

if [ "${CI:-}" = "true" ]; then
    OUT="$GITHUB_ENV"
else
    rm -f ./env
    OUT="./env"
fi

echo "FRP_VER = ${VER}"

REPO="docker.io/quackerd/frp"
echo "FRP_TAG=${REPO}:${VER}" >> "$OUT"
echo "FRP_TAG_LATEST=${REPO}:latest" >> "$OUT"
printf "%s" "$JSON" > release.json
