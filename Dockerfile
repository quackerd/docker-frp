FROM alpine:latest AS builder
ARG TARGETOS
ARG TARGETARCH

RUN apk add --no-cache curl tar jq xz
COPY ./release.json /release.json

RUN << "EOF"
set -euo pipefail

DOWNLOAD_URL=$(jq -r --arg arch "$TARGETARCH" --arg os "$TARGETOS" \
    '.assets[] | select(.name | contains($arch) and contains($os) and endswith(".tar.gz")) | .browser_download_url' /release.json)

mkdir -p /opt/frp

echo "Downloading from: ${DOWNLOAD_URL}"
curl -fsSL "$DOWNLOAD_URL" | tar -xz -C /opt/frp --strip-components=1
EOF


FROM alpine:latest

RUN addgroup -g 1000 -S frp \
 && adduser -u 1000 -S -D -H -G frp frp

COPY ./run.sh /opt/run.sh
COPY --from=builder /opt/frp /opt/frp

RUN <<'EOF'
    set -euo pipefail
    chmod +x /opt/run.sh
    chown -R frp:frp /opt/frp
    mkdir -p /config
    chown -R frp:frp /config
EOF

ENV SERVER=no
USER 1000:1000
VOLUME ["/config"]
CMD ["/opt/run.sh"]
