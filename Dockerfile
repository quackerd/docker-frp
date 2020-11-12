#
# Dockerfile for frp
# Based on: vimagick/frp
#

FROM alpine

ENV FRP_VERSION 0.34.2
ENV FRP_URL https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_linux_amd64.tar.gz

WORKDIR /opt/frp

RUN set -xe \
    && apk add --no-cache curl tar \
    && curl -sSL $FRP_URL | tar xz --strip 1 \
    && apk del curl tar

COPY ./run.sh /opt/run.sh
RUN chmod +x /opt/run.sh

CMD ["/opt/run.sh"]

