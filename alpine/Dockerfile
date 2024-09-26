FROM snowdreamtech/go:1.23.1-alpine AS builder
ENV GO111MODULE=auto
RUN mkdir /app
ADD hello.go go.mod /app/
WORKDIR /app
RUN go build -o hello .



FROM snowdreamtech/alpine:3.20.3

# OCI annotations to image
LABEL org.opencontainers.image.authors="Snowdream Tech" \
    org.opencontainers.image.title="HelloWorld Image Based On Alpine" \
    org.opencontainers.image.description="Docker Images for HelloWorld on Alpine. (i386, amd64, arm32v6, arm32v7, arm64, ppc64le,riscv64, s390x)" \
    org.opencontainers.image.documentation="https://hub.docker.com/r/snowdreamtech/helloworld" \
    org.opencontainers.image.base.name="snowdreamtech/helloworld:alpine" \
    org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.source="https://github.com/snowdreamtech/helloworld" \
    org.opencontainers.image.vendor="Snowdream Tech" \
    org.opencontainers.image.version="3.20.3" \
    org.opencontainers.image.url="https://github.com/snowdreamtech/helloworld"

# keep the docker container running
ENV KEEPALIVE=0

RUN apk add --no-cache \
    vim

COPY --from=builder /app/hello /usr/local/bin/

COPY docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]