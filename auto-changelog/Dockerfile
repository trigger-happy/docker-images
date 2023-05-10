FROM node:20.1.0-alpine3.17
LABEL maintainer="choa.james@gmail.com"

WORKDIR /src

RUN apk add git
RUN npm install -g auto-changelog

CMD ["auto-changelog"]
