FROM node:16.10.0-alpine3.14
LABEL maintainer="choa.james@gmail.com"

WORKDIR /app

RUN npm install -g @commitlint/cli @commitlint/config-conventional
COPY commitlint.config.js /app

CMD ["commitlint"]
