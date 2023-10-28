FROM python:3.8-slim-bookworm
LABEL maintainer="choa.james@gmail.com"

RUN useradd -mU litellm -s /bin/bash

RUN apt -y update && \
    apt -y upgrade && \
    apt -y install \
      git && \
    apt -y clean all


WORKDIR /home/litellm

ENV LC_ALL=C.UTF-8 \
    LANG=C.UTF-8 \
    PORT=8080 \
    LITELLM_PROXY_REPO=https://github.com/BerriAI/liteLLM-proxy.git \
    LITELLM_PROXY_REF=b3f6be9260cc472015ecf6cc434d5583d1db59fd

RUN git clone $LITELLM_PROXY_REPO && \
    cd liteLLM-proxy && \
    git checkout $LITELLM_PROXY_REF && \
    pip3 install --no-cache-dir -r requirements.txt && \
    chown -R litellm:litellm /home/litellm/liteLLM-proxy

USER litellm
WORKDIR /home/litellm/liteLLM-proxy

EXPOSE 8080

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]
