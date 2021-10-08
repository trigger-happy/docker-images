FROM python:3.10.0-buster as base

ENV BACKEND_STORE_URI=file:///data/mlruns \
    HOST=0.0.0.0 \
    PORT=5000 \
    DEFAULT_ARTIFACT_ROOT=/data/artifacts \
    WORKERS=4 \
    METRICS_DIR=/data/metrics

RUN useradd -mU mlflow

WORKDIR /mlflow
COPY requirements.txt .
COPY docker-entrypoint.sh /

RUN pip install -r requirements.txt && \
    mkdir -p $BACKEND_STORE_URI $DEFAULT_ARTIFACT_ROOT $METRICS_DIR && \
    chown mlflow:mlflow -R /mlflow $BACKEND_STORE_URI $DEFAULT_ARTIFACT_ROOT $METRICS_DIR

USER mlflow

ENTRYPOINT ["/docker-entrypoint.sh"]
