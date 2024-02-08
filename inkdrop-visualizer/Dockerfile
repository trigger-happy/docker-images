FROM node:21-alpine3.18
LABEL maintainer="choa.james@gmail.com"

WORKDIR /app

RUN npm install -g inkdrop-visualizer

CMD ["inkdrop", "--from-plan", "plan.out"]
