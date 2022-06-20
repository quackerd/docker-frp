#!/bin/sh

apk add --no-cache jq curl
VER=$(curl -sL https://api.github.com/repos/fatedier/frp/releases/latest | jq -r ".tag_name")
VER="${VER:1}"
echo $VER
echo -n "$VER,latest" > .tags
sed -i -E "s/var_FRP_VERSION/$VER/" Dockerfile