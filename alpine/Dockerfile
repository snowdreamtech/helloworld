FROM --platform=$BUILDPLATFORM snowdreamtech/golang:1.23.7-alpine3.21 AS builder

ARG TARGETOS
ARG TARGETARCH

# Switch to the user
USER go

# Set the workdir
WORKDIR /home/go/go/src/snowdream.tech/helloworld

ENV GO111MODULE=auto

COPY hello.go go.mod ./

RUN CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -trimpath -ldflags "-s -w" -v -o /home/go/hello 


FROM snowdreamtech/alpine:3.21.3

# OCI annotations to image
LABEL org.opencontainers.image.authors="Snowdream Tech" \
    org.opencontainers.image.title="HelloWorld Image Based On Alpine" \
    org.opencontainers.image.description="Docker Images for HelloWorld on Alpine. (i386, amd64, arm32v6, arm32v7, arm64, ppc64le,riscv64, s390x)" \
    org.opencontainers.image.documentation="https://hub.docker.com/r/snowdreamtech/helloworld" \
    org.opencontainers.image.base.name="snowdreamtech/helloworld:alpine" \
    org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.source="https://github.com/snowdreamtech/helloworld" \
    org.opencontainers.image.vendor="Snowdream Tech" \
    org.opencontainers.image.version="3.21.3" \
    org.opencontainers.image.url="https://github.com/snowdreamtech/helloworld"
    
# Switch to the user
USER root

# Set the workdir
WORKDIR /root

# keep the docker container running
ENV KEEPALIVE=0 \
    # The cap_net_bind_service capability in Linux allows a process to bind a socket to Internet domain privileged ports, 
    # which are port numbers less than 1024. 
    CAP_NET_BIND_SERVICE=0 

ARG GID=1000 \
    UID=1000  \
    USER=root \
    WORKDIR=/root

# Create a user with UID and GID
RUN if [ "${USER}" != "root" ]; then \
    addgroup -g ${GID} ${USER}; \
    adduser -h /home/${USER} -u ${UID} -g ${USER} -G ${USER} -s /bin/sh -D ${USER}; \
    # sed -i "/%sudo/c ${USER} ALL=(ALL:ALL) NOPASSWD:ALL" /etc/sudoers; \
    fi

# Enable CAP_NET_BIND_SERVICE
RUN if [ "${USER}" != "root" ] && [ "${CAP_NET_BIND_SERVICE}" -eq 1 ]; then \
    apk add --no-cache libcap; \
    # setcap 'cap_net_bind_service=+ep' `which nginx`; \
    fi

COPY --from=builder /home/go/hello /usr/local/bin/
   
RUN chown -R ${USER}:${USER} /usr/local/bin/hello

# Switch to the user
USER ${USER}

# Set the workdir
WORKDIR ${WORKDIR}

COPY docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]