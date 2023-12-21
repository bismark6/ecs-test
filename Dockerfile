FROM node:16-alpine

WORKDIR /app

COPY package*.json ./
RUN npm install
COPY ./node_modules ./
COPY ./Dockerfile ./
CMD node index.js
EXPOSE 8080 80