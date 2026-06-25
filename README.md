# docker-frp

[![build](https://git.quacker.org/d/docker-frp/badges/workflows/build.yaml/badge.svg?branch=master&label=build)](https://git.quacker.org/d/docker-frp/actions)
[![frp version](https://img.shields.io/docker/v/quackerd/frp?sort=semver&label=frp%20version)](https://git.quacker.org/d/docker-frp/actions)
[![amd64](https://img.shields.io/docker/image-size/quackerd/frp/latest?arch=amd64&label=amd64)](https://hub.docker.com/r/quackerd/frp)
[![aarch64](https://img.shields.io/docker/image-size/quackerd/frp/latest?arch=arm64&label=aarch64)](https://hub.docker.com/r/quackerd/frp)

Docker image for frp. Binaries directly obtained from the official frp repo [fatedier/frp](https://github.com/fatedier/frp). Automatic weekly builds. You can start with the sample `docker-compose.yml` in this repo.

## Networking
Either use `network_mode = host` or manually expose the listening port as well as all the reverse proxied ports.

## Environment Variables
`SERVER`. Defaults to `yes` = server mode. `no` = client mode.

## Volumes

Bind mount a host folder to `/config`. Make sure the folder is owned by `1000:1000`. Both server and client mode use the same `/config/config.toml` config file.

## Troubleshooting
The logs can be obtained by `docker logs <container_name>`. They are usually very self-explanatory.
