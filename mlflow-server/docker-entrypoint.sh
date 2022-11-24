#!/bin/sh

mkdir -p /data/mlruns /data/metrics /data/artifacts

exec mlflow server
