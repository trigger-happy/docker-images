FROM nvidia/cuda:12.4.1-devel-ubuntu22.04

ENV HOME=/app/aphrodite-engine \
    APHRODITE_REPO=https://github.com/PygmalionAI/aphrodite-engine.git \
    APHRODITE_REF=205c8e4106a9fc0cdc45102ea11b0eed80a807aa

WORKDIR $HOME

# Upgrade OS Packages + Prepare Python Environment
RUN set -eux; \
    export DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y bzip2 g++ git make python3-pip tzdata \
    && rm -fr /var/lib/apt/lists/*

# Alias python3 to python
RUN ln -s /usr/bin/python3 /usr/bin/python

RUN python3 -m pip install --no-cache-dir --upgrade pip

RUN git clone $APHRODITE_REPO /tmp/aphrodite-engine \
    && cd /tmp/aphrodite-engine \
    && git checkout $APHRODITE_REF \
    && cd $HOME \
    && mv /tmp/aphrodite-engine/* . \
    && rm -fr /tmp/aphrodite-engine \
    && chmod +x docker/entrypoint.sh

# Export the CUDA_HOME variable correctly
ENV CUDA_HOME=/usr/local/cuda

ENV HF_HOME=/tmp
ENV NUMBA_CACHE_DIR=$HF_HOME/numba_cache
ENV MAX_JOBS=2
ENV TORCH_CUDA_ARCH_LIST="6.1 7.0 7.5 8.0 8.6 8.9 9.0+PTX"
RUN python3 -m pip install --no-cache-dir -e .

# Entrypoint exec form doesn't do variable substitution automatically ($HOME)
ENTRYPOINT ["/app/aphrodite-engine/docker/entrypoint.sh"]

EXPOSE 7860

USER 1000:0

VOLUME ["/tmp"]
