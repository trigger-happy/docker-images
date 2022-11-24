#!/bin/sh

exec mlflow server \
  --host $HOST \
  --port $PORT \
  --backend-store-uri $BACKEND_STORE_URI \
  --default-artifact-root $DEFAULT_ARTIFACT_ROOT \
  --workers $WORKERS \
  --expose-prometheus $METRICS_DIR
