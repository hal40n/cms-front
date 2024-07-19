# Dockerfile
FROM node:20.5.1-alpine

RUN apk add --no-cache git bash

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

EXPOSE 5172

CMD ["npm", "run", "dev", "--", "--host"]
