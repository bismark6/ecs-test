FROM node:16-alpine

WORKDIR /app

COPY package*.json ./
RUN npm install
COPY /Users/bismarkankamah/Desktop/ecs-test/index.js ./
COPY /Users/bismarkankamah/Desktop/ecs-test/package-lock.json ./
COPY /Users/bismarkankamah/Desktop/ecs-test/package.json ./
<<<<<<< HEAD
=======
COPY /Users/bismarkankamah/Desktop/ecs-test/ecr.tf ./
>>>>>>> master
CMD node index.js
EXPOSE 8080 80