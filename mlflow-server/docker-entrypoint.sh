#!/bin/sh

mkdir -p /data/mlruns /data/metrics /data/artifacts

if [ ! -f /data/mlflow.db ]; then
  sqlite3 /data/mlflow.db "VACUUM;"
fi

exec mlflow server
