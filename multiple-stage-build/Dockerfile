# stage 1 - base
FROM node:14-alpine as base

EXPOSE 1314

ENV NODE_ENV = production

WORKDIR /opt/app

COPY ./package*.json ./

RUN npm config set registry=https://registry.npm.taobao.org \
    && npm ci \
    && npm cache clean --force


# stage 2 - developement

FROM base as dev

ENV NODE_ENV = developement

WORKDIR /opt/app

RUN npm install --only=developement

CMD ["node", "app.js", "--inspect=localhost:9229"]

# stage 3 - production

FROM base as pro

COPY . .

CMD ["node", "app.js"]