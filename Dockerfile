FROM node:carbon

RUN apt-get update && \
  apt-get install -y postgresql-client graphicsmagick

WORKDIR app

COPY package*.json /app/
COPY tools/docker/wait-for-migrate-db-container.sh /

RUN npm install

ENV PATH="/app/node_modules/.bin:${PATH}"
