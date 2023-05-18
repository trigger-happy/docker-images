FROM nvidia/cuda:11.8.0-devel-ubuntu22.04
LABEL maintainer="choa.james@gmail.com"

RUN useradd -mU webui

RUN apt -y update && \
    apt -y upgrade && \
    apt -y install \
      nvidia-cuda-toolkit \
      python3 \
      python3-pip \
      build-essential \
      bash \
      git && \
    apt -y clean all && \
    update-alternatives --install /usr/bin/python python /usr/bin/python3 10 && \
    update-alternatives --install /usr/bin/pip pip /usr/bin/pip3 10

WORKDIR /home/webui

ENV LC_ALL=C.UTF-8 \
    LANG=C.UTF-8 \
    PORT=8080 \
    GPUMEMORY=23Gib \
    CPUMEMORY=64Gib \
    THREADS=16 \
    WEBUI_REF=5f6cf39

ARG TORCH_CUDA_ARCH_LIST="8.6+PTX" \
    CUDA_VISIBLE_DEVICES=1

RUN git clone https://github.com/oobabooga/text-generation-webui.git && \
    cd text-generation-webui && \
    git checkout $WEBUI_REF && \
    pip3 install -r requirements.txt && \
    mkdir repositories && \
    cd repositories && \
    pip uninstall quant_cuda && \
    rm -rf GPTQ-for-LLaMA && \
    git clone https://github.com/qwopqwop200/GPTQ-for-LLaMa.git -b cuda && \
    cd GPTQ-for-LLaMa && \
    pip install -r requirements.txt && \
    python setup_cuda.py install && \
    chown -R webui:webui /home/webui

COPY docker-entrypoint.sh /home/webui/docker-entrypoint.sh
RUN chown webui:webui /home/webui/docker-entrypoint.sh

USER webui

VOLUME /home/webui/text-generation-webui/models
VOLUME /home/webui/text-generation-webui/loras
VOLUME /home/webui/text-generation-webui/prompts
VOLUME /home/webui/text-generation-webui/softprompts

EXPOSE 8080

ENTRYPOINT ["/home/webui/docker-entrypoint.sh"]
