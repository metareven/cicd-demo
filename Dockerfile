FROM node:alpine3.11

COPY index.js index.js
COPY package.json package.json

RUN npm install

EXPOSE 8080
EXPOSE 80

ENTRYPOINT node index.js