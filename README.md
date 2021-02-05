[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Build Status](https://ci.quacker.org/api/badges/d/docker-frp/status.svg)](https://ci.quacker.org/d/docker-frp)

# docker-frp
Docker image for frp. Binaries directly obtained from the official frp repo [fatedier/frp](https://github.com/fatedier/frp).

The instructions below apply to `docker-compose`.

# Networking
We recommend using the `network_mode = host` (host network) option.
Otherwise you would need to manually expose the listening port as well as all the reverse proxied ports. 

# Environment variables

`SERVER`. Defaults to 0 = client mode. 1 = server mode.

# Volumes

Note the difference in file names (frps.ini vs frpc.ini)

## Client mode
Client configuration file `frpc.ini` -> `/opt/frp/frpc.ini`

## Server mode
Server configuration file `frps.ini` -> `/opt/frp/frps.ini`

# docker-compose
## Sample Client
```
version: "2.1"
services:
        frp:
                image: quackerd/frp
                container_name: frp
                network_mode: host
                restart: unless-stopped
                volumes:
                        - ./config/frpc.ini:/opt/frp/frpc.ini
```

## Sample Server
```
version: "2.1"
services:
        frp:
                image: quackerd/frp
                container_name: frp_srv
                network_mode: host
                restart: unless-stopped
                environment:
                        - SERVER=1
                volumes:
                        - ./config/frps.ini:/opt/frp/frps.ini
```
# Troubleshooting
The logs can be obtained by `docker logs <container_name>`. They are usually very self-explanatory.
