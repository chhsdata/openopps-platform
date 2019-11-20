FROM node:carbon

RUN apt-get update && \
  apt-get install -y postgresql-client graphicsmagick

COPY tools/docker/wait-for-migrate-db-container.sh /

WORKDIR /app

COPY package.json .
COPY tools ./tools

RUN npm install

ENV PATH="/app/node_modules/.bin:${PATH}"
