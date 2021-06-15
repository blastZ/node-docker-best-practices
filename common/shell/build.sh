#!/bin/bash

source ./sh.config

TAG_NAME=${NAME}:${VERSION}

docker build . -t ${TAG_NAME} --target production

docker image save ${TAG_NAME} | gzip > ${NAME}-${VERSION}.tar.gz