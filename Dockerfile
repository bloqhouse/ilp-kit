FROM node:9-slim

RUN apt-get update && apt-get install -y python postgresql libpq-dev build-essential libpq5 git vim

COPY . /usr/src/app
WORKDIR /usr/src/app

RUN yarn
#RUN cd api && yarn
#RUN cd ledger && yarn
#RUN cd client && yarn && yarn build
#RUN cd webserver && yarn

ENV NODE_ENV production
EXPOSE 80
EXPOSE 3010
EXPOSE 3100
EXPOSE 3101

CMD echo "var config = { apiUrl: 'https://$API_HOSTNAME/api' }" > /usr/src/app/client/build/config.js && npm start
