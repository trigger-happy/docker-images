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
    LITELLM_PROXY_REPO=https://github.com/BerriAI/litellm.git \
    LITELLM_PROXY_REF=v0.11.1

RUN git clone $LITELLM_PROXY_REPO && \
    cd litellm && \
    git checkout $LITELLM_PROXY_REF && \
    pip3 install --no-cache-dir -r requirements.txt && \
    chown -R litellm:litellm /home/litellm/litellm

USER litellm
WORKDIR /home/litellm/litellm

EXPOSE 8080

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]
