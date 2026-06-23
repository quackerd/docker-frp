#!/bin/sh
set -euo pipefail

case "$FRP_ARCH" in
    linux/amd64)
        SUFFIX=linux_amd64
        ;;
    linux/arm64)
        SUFFIX=linux_arm64
        ;;
    *)
        echo "Unsupported runner architecture: \"$FRP_ARCH\"" >&2
        exit 1
        ;;
esac

JSON=$(curl -fsSL https://api.github.com/repos/fatedier/frp/releases/latest)
VER=$(printf "%s" "$JSON" | jq -r ".tag_name")
URL=$(printf "%s" "$JSON" | jq -er --arg suffix "$SUFFIX" '
    .assets[]
    | select(.name | endswith("\($suffix).tar.gz"))
    | .browser_download_url')

echo "FRP_VER=$VER" > env
echo "FRP_URL=$URL" >> env
