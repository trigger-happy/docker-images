FROM python:3.9.3-buster as base

RUN useradd -mU mlflow

WORKDIR /mlflow
COPY requirements.txt .
COPY docker-entrypoint.sh /

RUN pip install -r requirements.txt && \
    chown mlflow:mlflow -R /mlflow

USER mlflow

ENTRYPOINT ["/docker-entrypoint.sh"]
