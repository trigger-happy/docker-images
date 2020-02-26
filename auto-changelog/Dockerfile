FROM node:13.8.0-alpine

WORKDIR /src

RUN apk add git
RUN npm install -g auto-changelog

CMD ["auto-changelog"]
