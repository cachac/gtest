# build stage
FROM node:lts-alpine as build-stage
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production --loglevel verbose
COPY . .
RUN npm run build

# production stage
FROM node:lts-alpine AS production-stage
COPY --from=build-stage /app/dist /app/dist

EXPOSE 3000

ARG NODE_ENV=development
ENV NODE_ENV=${NODE_ENV}
RUN if [ "$NODE_ENV" = "production" ] ; then  echo YOU ARE READY FOR $NODE_ENV !!!;  \
else echo $NODE_ENV environment; \
fi 

CMD ["npm", "start"]