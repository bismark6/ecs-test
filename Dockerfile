FROM node:16-alpine

WORKDIR /app

COPY package*.json ./
RUN npm install
COPY .. ./

ENV PORT=443

EXPOSE 443

CMD node index.js
