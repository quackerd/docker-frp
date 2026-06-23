#!/bin/sh
sh ./tag.sh

case "$-" in
    *a*) PREV_A="on" ;;
    *)   PREV_A="off" ;;
esac

set -a
. ./env

if [ "$PREV_A" = "off" ]; then
    set +a
fi

#docker buildx bake --set "*.platform=linux/arm64" --load
docker buildx bake --load