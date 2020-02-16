FROM node:lts-alpine as build-stage

WORKDIR /app

COPY package*.json ./

RUN apk --no-cache add --virtual builds-deps build-base python
RUN npm ci --only=production --loglevel verbose

COPY . .

EXPOSE 3000

ARG NODE_ENV=development
ENV NODE_ENV=${NODE_ENV}
RUN if [ "$NODE_ENV" = "production" ] ; then  echo YOU ARE READY FOR $NODE_ENV !!!;  \
else echo $NODE_ENV environment; \
fi 

CMD ["npm", "start"]