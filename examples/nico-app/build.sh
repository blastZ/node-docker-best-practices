#!/bin/bash
NAME=nico-app

VERSION=$(cat package.json \
  | grep version \
  | head -1 \
  | awk -F: '{ print $2 }' \
  | sed 's/[",]//g' \
  | tr -d '[[:space:]]')

TAG_NAME=${NAME}:${VERSION}

echo ${TAG_NAME}

docker build . -t ${TAG_NAME} --target production

docker image save ${TAG_NAME} | gzip > ${NAME}-${VERSION}.tar.gz