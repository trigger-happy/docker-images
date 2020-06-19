FROM alpine:3.11 as base

WORKDIR /app

RUN apk update && apk add --update-cache curl

ARG STORJ_VERSION=v1.6.3

RUN curl -L https://github.com/storj/storj/releases/download/$STORJ_VERSION/gateway_linux_amd64.zip -O && \
    unzip gateway_linux_amd64.zip && \
    chmod 755 gateway && \
    mv gateway /usr/local/bin/gateway && \
    rm gateway_linux_amd64.zip

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod 0755 /usr/local/bin/docker-entrypoint.sh

RUN adduser \
    --disabled-password \
    --gecos "" \
    --home "/nonexistent" \
    --shell "/sbin/nologin" \
    --no-create-home \
    --uid "10001" \
    "appuser"

RUN mkdir -p /config/minio && chown appuser:appuser -R /config

ENV API_KEY SATELLITE_ADDR MINIO_ACCESS_KEY
VOLUME /config
EXPOSE 7777

USER 10001

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["gateway", "run", "--config-dir", "/config"]
