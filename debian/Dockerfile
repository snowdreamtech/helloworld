FROM snowdreamtech/go:1.23.1-bookworm AS builder
ENV GO111MODULE=auto
RUN mkdir /app
ADD hello.go go.mod /app/
WORKDIR /app
RUN go build -o hello .



FROM snowdreamtech/debian:12.7.0

# OCI annotations to image
LABEL org.opencontainers.image.authors="Snowdream Tech" \
    org.opencontainers.image.title="HelloWorld Image Based On Debian" \
    org.opencontainers.image.description="Docker Images for HelloWorld on Debian. (i386,amd64,arm32v5,arm32v7,arm64,mips64le,ppc64le,s390x)" \
    org.opencontainers.image.documentation="https://hub.docker.com/r/snowdreamtech/helloworld" \
    org.opencontainers.image.base.name="snowdreamtech/helloworld:debian" \
    org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.source="https://github.com/snowdreamtech/helloworld" \
    org.opencontainers.image.vendor="Snowdream Tech" \
    org.opencontainers.image.version="12.7" \
    org.opencontainers.image.url="https://github.com/snowdreamtech/helloworld"

# keep the docker container running
ENV KEEPALIVE=0

RUN set -eux \
    && apt-get -qqy update  \
    && apt-get -qqy install --no-install-recommends \ 
    vim \
    && apt-get -qqy --purge autoremove \
    && apt-get -qqy clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/* \
    && rm -rf /var/tmp/*

COPY --from=builder /app/hello /usr/local/bin/

COPY docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]