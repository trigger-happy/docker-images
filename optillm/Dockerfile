FROM ubuntu:24.04 as base
LABEL maintainer="choa.james@gmail.com"

ENV PYTHONUNBUFFERED=1 \
    DEBIAN_FRONTEND=noninteractive \
    OPTILLM_REPO=https://github.com/codelion/optillm.git \
    OPTILLM_REF=3bad2f3f6027f13859338c74b79552c8de4f347c \
    VENV_LOCATION=/home/optillm/.venv \
    LC_ALL=C.UTF-8 \
    LANG=C.UTF-8

RUN apt -y update && \
    apt -y upgrade && \
    apt -y install \
      curl \
      python3 \
      python3-pip \
      bash \
      python3-venv \
      git \
      ca-certificates && \
    apt -y clean all && \
    update-alternatives --install /usr/bin/python python /usr/bin/python3 12 && \
    update-alternatives --install /usr/bin/pip pip /usr/bin/pip3 12

RUN useradd -mU optillm -s /bin/bash
WORKDIR /home/optillm

COPY --chown=1000:1000 docker-entrypoint.sh /home/optillm/docker-entrypoint.sh
RUN chmod a+rx docker-entrypoint.sh

USER optillm

RUN python3 -m venv $VENV_LOCATION

RUN git clone $OPTILLM_REPO \
    && cd optillm \
    && git checkout $OPTILLM_REF \
    && $VENV_LOCATION/bin/pip3 install -r requirements.txt

EXPOSE 8000

ENTRYPOINT ["/home/optillm/docker-entrypoint.sh"]
