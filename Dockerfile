FROM node:alpine3.11

COPY index.js index.js
COPY package.json package.json

RUN npm install

ENTRYPOINT node index.js