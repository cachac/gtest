# build stage
FROM mhart/alpine-node:12 as build-stage
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production --loglevel verbose

FROM mhart/alpine-node:slim-12
WORKDIR /app

COPY --from=build-stage /app .
COPY . .

EXPOSE 3000

ARG NODE_ENV=development
ENV NODE_ENV=${NODE_ENV}
RUN if [ "$NODE_ENV" = "production" ] ; then  echo YOU ARE READY FOR $NODE_ENV !!!;  \
else echo $NODE_ENV environment; \
fi 

CMD ["node", "src/main.js"]