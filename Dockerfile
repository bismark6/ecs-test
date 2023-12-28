FROM node:16-alpine

RUN apk -U add --no-cache 

WORKDIR /app

COPY package*.json ..
RUN npm install
COPY .. ./
CMD node index.js
EXPOSE 8080 80