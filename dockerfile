# build stage
FROM mhart/alpine-node:12 as build-stage
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production --loglevel verbose

FROM mhart/alpine-node:slim-12
WORKDIR /app

COPY --from=build-stage /app .
COPY . .

#args
ARG APP_NAME=gtest
ARG APP_VERSION=0.3
ARG NODE_PORT=3000
ARG NODE_ENV=development

ENV APP_NAME=${APP_NAME}
ENV APP_VERSION=${APP_VERSION}
ENV NODE_PORT=${NODE_PORT}
ENV NODE_ENV=${NODE_ENV}

RUN echo $APP_NAME v$APP_VERSION in $NODE_ENV on port $NODE_PORT 

EXPOSE $NODE_PORT

CMD ["node", "src/main.js"]