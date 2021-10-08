FROM node:16.10.0-alpine3.14
LABEL maintainer="choa.james@gmail.com"

WORKDIR /src

RUN apk add git
RUN npm install -g auto-changelog

CMD ["auto-changelog"]
