#!/bin/sh

set -e

if [[ ! -f "/config/config.yaml" ]]; then
  gateway setup --config-dir /config \
    --non-interactive \
    --minio.access-key $MINIO_ACCESS_KEY \
    --minio.secret-key $MINIO_SECRET_KEY \
    --minio.dir /config/minio \
    --api-key $API_KEY \
    --server.address 0.0.0.0:7777 \
    --satellite-addr $SATELLITE_ADDR
fi

exec "$@"
