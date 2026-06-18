#!/bin/sh
set -euo pipefail

if [ "${SERVER:-no}" = "yes" ]; then
	echo "Running in SERVER mode..."
    exec /opt/frp/frps -c /config/config.toml
else
	echo "Running in CLIENT mode..."
    exec /opt/frp/frpc -c /config/config.toml
fi
