#!/bin/sh

PROJECT=snowdreamtech/helloworld

docker buildx build --platform=linux/386,linux/amd64,linux/arm/v6,linux/arm/v7,linux/arm64/v8,linux/ppc64le,linux/s390x \
-t ${PROJECT}:latest \
-t ${PROJECT}:1.21.3-alpine3.18 \
-t ${PROJECT}:1.21-alpine3.18 \
-t ${PROJECT}:1-alpine3.18 \
-t ${PROJECT}:alpine3.18 \
-t ${PROJECT}:1.21.3-alpine \
-t ${PROJECT}:1.21-alpine \
-t ${PROJECT}:1-alpine \
-t ${PROJECT}:alpine \
. \
--push
