#!/bin/sh
set -euo pipefail

JSON=$(curl -fsSL https://api.github.com/repos/fatedier/frp/releases/latest)
VER=$(printf "%s" "$JSON" | jq -r ".tag_name")
URL=$(printf "%s" "$JSON" | jq -r '
    .assets[]
    | select(.name | endswith("linux_amd64.tar.gz"))
    | .browser_download_url')

echo "FRP_VER=$VER" > env
echo "FRP_URL=$URL" >> env
