FROM python:3.12-bullseye as base

ENV MLFLOW_BACKEND_STORE_URI=sqlite:////data/mlflow.db \
    MLFLOW_HOST=0.0.0.0 \
    MLFLOW_PORT=5000 \
    MLFLOW_DEFAULT_ARTIFACT_ROOT=mlflow-artifacts:/ \
    MLFLOW_ARTIFACTS_DESTINATION=/data/mlartifacts \
    MLFLOW_WORKERS=4 \
    MLFLOW_REGISTRY_STORE_URI=sqlite:////data/mlflow.db \
    MLFLOW_EXPOSE_PROMETHEUS=/data/metrics

RUN apt -y update && apt -y install sqlite3

RUN useradd -mU mlflow

WORKDIR /mlflow
COPY requirements.txt .
COPY docker-entrypoint.sh /

RUN pip install -r requirements.txt && \
    mkdir -p /data/mlruns $DEFAULT_ARTIFACT_ROOT $METRICS_DIR && \
    chown mlflow:mlflow -R /mlflow /data/mlruns $DEFAULT_ARTIFACT_ROOT $METRICS_DIR

USER mlflow

ENTRYPOINT ["/docker-entrypoint.sh"]
