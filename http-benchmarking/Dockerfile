FROM alpine:3.14.2 as base
LABEL maintainer="choa.james@gmail.com"

WORKDIR /app

RUN apk update && \
    apk upgrade && \
    apk add wrk && \
    rm -rf /var/cace/apk

RUN adduser \
      --disabled-password \
      --gecos "" \
      --home "/app" \
      --shell "/sbin/nologin" \
      --uid 10000 \
      tester && \
    chown tester:tester -R /app

USER tester
WORKDIR /app

ENV THREADS=1 \
    DURATION=1m \
    CONNECTIONS=1 \
    URL=http://localhost:8080/

CMD ["/bin/sh", "-c", "wrk -t $THREADS -d $DURATION -c $CONNECTIONS $URL"]
