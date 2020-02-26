FROM node:13.8.0-alpine

WORKDIR /app

RUN npm install -g @commitlint/cli @commitlint/config-conventional
COPY commitlint.config.js /app

CMD ["commitlint"]
