FROM alpine:latest

ARG FRP_URL

RUN addgroup -g 1000 -S frp \
 && adduser -u 1000 -S -D -H -G frp frp

RUN apk add --no-cache --virtual .build-deps curl tar

RUN <<'EOF'
    set -euo pipefail
    mkdir -p /opt/frp
    curl -fsSL "$FRP_URL" | tar -xz -C /opt/frp --strip-components=1
EOF

RUN apk del .build-deps

COPY ./run.sh /opt/run.sh
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
