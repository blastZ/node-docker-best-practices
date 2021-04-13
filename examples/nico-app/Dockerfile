# stage - base
FROM node:lts-alpine@sha256:bdec2d4aa13450a2e2654e562df1d8a3016b3c4ab390ccd3ed09d861cbdb0d83 as base

ENV NODE_ENV production
ENV APP_ENV production

WORKDIR /usr/src/app
COPY package*.json ./

RUN npm config set registry=https://registry.npm.taobao.org \
  && npm install pm2 -g \
  && npm install --only=production \
  && npm cache clean --force

# stage - build
FROM base as build

COPY . .

RUN npm install --only=development \ 
  && npm run tsc

# stage - dev
FROM base as dev

RUN npm install --only=development

CMD ["npm", "run", "dev"]

# stage - production
FROM base as production

COPY --from=build /usr/src/app/dist ./dist
COPY ecosystem.config.js ./

USER node

CMD ["pm2-runtime", "--raw", "ecosystem.config.js", "--env", "${APP_ENV}"]