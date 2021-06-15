#!/bin/bash

source sh.config

DIR_NAME=${NAME}-${VERSION}

mkdir ./${DIR_NAME}
mkdir ./${DIR_NAME}/log

cp ./${NAME}-${VERSION}.tar.gz ./${DIR_NAME}
# cp ./config/production.js ./${DIR_NAME}/config.js

cat <<EOF >./${DIR_NAME}/deploy.sh
#/bin/bash

docker image load < ./${NAME}-${VERSION}.tar.gz

docker run \\
  -dt \\
  -e APP_ENV=production \\
  --restart=always \\
  --name ${NAME}-${VERSION} \\
  -v ${CONFIG_PATH}:/usr/src/app/config.js \\
  -v ${LOG_PATH}:/usr/src/app/log \\
  --network nico-app \\
  -p ${PORT}:${PORT} \\
${NAME}:${VERSION}
EOF

chmod 777 ./${DIR_NAME}/deploy.sh

tar czvf ${NAME}-pro-${VERSION}.tar.gz ./${DIR_NAME}

rm -rf ./${DIR_NAME}