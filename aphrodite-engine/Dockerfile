FROM nvidia/cuda:12.4.1-devel-ubuntu22.04

ENV HOME=/app/aphrodite-engine \
    CUDA_HOME=/usr/local/cuda \
    APHRODITE_REPO=https://github.com/PygmalionAI/aphrodite-engine.git \
    APHRODITE_REF=85c5c146a480b2e4285f4775b78e9db3a7270141

WORKDIR $HOME

RUN useradd -mU aphrodite

# Upgrade OS Packages + Prepare Python Environment
RUN set -eux; \
    export DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y bzip2 g++ git make python3-pip tzdata libgl1-mesa-dev libglib2.0-0 \
    && rm -fr /var/lib/apt/lists/*

# Alias python3 to python
RUN ln -s /usr/bin/python3 /usr/bin/python

RUN python3 -m pip install --no-cache-dir --upgrade pip

RUN git clone $APHRODITE_REPO /tmp/aphrodite-engine \
    && cd /tmp/aphrodite-engine \
    && git checkout $APHRODITE_REF \
    && cd $HOME \
    && mv /tmp/aphrodite-engine/* . \
    && rm -fr /tmp/aphrodite-engine

# Export the CUDA_HOME variable correctly
ENV CUDA_HOME=/usr/local/cuda

ENV HF_HOME=/tmp
ENV NUMBA_CACHE_DIR=$HF_HOME/numba_cache
ENV MAX_JOBS=2
ENV TORCH_CUDA_ARCH_LIST="8.0 8.6 8.9 9.0+PTX"
RUN python3 -m pip install -r requirements-cuda.txt
RUN python3 -m pip install --no-cache-dir -e .
RUN python3 -m pip install 'flash-attn>=2.5.8' ray --no-build-isolation

COPY entrypoint.sh .
RUN chmod a+x entrypoint.sh

EXPOSE 7860

RUN chown -R 1000:1000 ${HOME}

USER 1000:0

VOLUME ["/tmp"]

# Entrypoint exec form doesn't do variable substitution automatically ($HOME)
ENTRYPOINT ["/app/aphrodite-engine/entrypoint.sh"]
