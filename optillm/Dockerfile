FROM ubuntu:24.04 as base
LABEL maintainer="choa.james@gmail.com"

RUN useradd -mU optillm
WORKDIR /home/optillm

ENV PYTHONUNBUFFERED=1 \
    DEBIAN_FRONTEND=noninteractive \
    OPTILLM_REPO=https://github.com/codelion/optillm.git \
    OPTILLM_REF=ae0f2b4401933f2ffb485b33c0fd8e394be06950 \
    VENV_LOCATION=/home/optillm/.venv \
    LC_ALL=C.UTF-8 \
    LANG=C.UTF-8

ENV OPENAI_BASE_URL=http://localhost:8080/v1 \
    OPENAI_API_KEY=no_key \
    MODEL_NAME=custom \
    APPROACH=auto \
    SIMULATIONS=2 \
    EXPLORATION=0.2 \
    DEPTH=1 \
    BEST_OF_N=3 \
    RSTAR_MAX_DEPTH=3 \
    RSTAR_NUM_ROLLOUTS=5 \
    RSTAR_C=1.4 \
    NUM_FINAL_RESPONSES=1 \
    RETURN_FULL_RESPONSE=False \
    PORT=8000 \
    OPTILLM_API_KEY=changeme


COPY docker-entrypoint.sh .

RUN apt -y update && \
    apt -y upgrade && \
    apt -y install \
      curl \
      python3 \
      python3-pip \
      python3-venv \
      git \
      ca-certificates && \
    apt -y clean all && \
    update-alternatives --install /usr/bin/python python /usr/bin/python3 12 && \
    update-alternatives --install /usr/bin/pip pip /usr/bin/pip3 12

USER optillm

RUN python3 -m venv $VENV_LOCATION

RUN git clone $OPTILLM_REPO \
    && cd optillm \
    && git checkout $OPTILLM_REF \
    && $VENV_LOCATION/bin/pip3 install -r requirements.txt

EXPOSE 8000

ENTRYPOINT ["/home/optillm/docker-entrypoint.sh"]
