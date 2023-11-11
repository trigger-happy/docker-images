FROM nvidia/cuda:11.8.0-devel-ubuntu22.04
LABEL maintainer="choa.james@gmail.com"

RUN useradd -mU webui

RUN apt -y update && \
    apt -y upgrade && \
    apt -y install \
      nvidia-cuda-toolkit \
      python3 \
      python3-pip \
      python3-venv \
      build-essential \
      bash \
      ninja-build \
      neovim \
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
    WEBUI_REPO=https://github.com/oobabooga/text-generation-webui.git \
    WEBUI_REF=7a3ca2c68f1ca49ac4e4b62f016718556fd3805c

ARG TORCH_CUDA_ARCH_LIST="8.6+PTX" \
    CUDA_VISIBLE_DEVICES=1

RUN git clone $WEBUI_REPO && \
    cd text-generation-webui && \
    git checkout $WEBUI_REF && \
    pip3 install torch==2.0.1+cu118 torchvision==0.15.2+cu118 torchaudio==2.0.2 --index-url https://download.pytorch.org/whl/cu118 && \
    pip3 install 'triton==2.0.0' && \
    pip3 install -r requirements.txt && \
    mkdir repositories && \
    cd repositories && \
    git clone https://github.com/turboderp/exllama && \
    pip install tiktoken SpeechRecognition safetensors sentencepiece ninja sentence_transformers && \
    pip uninstall quant_cuda && \
    rm -rf GPTQ-for-LLaMA && \
    git clone https://github.com/qwopqwop200/GPTQ-for-LLaMa.git -b cuda && \
    cd GPTQ-for-LLaMa && \
    pip install -r requirements.txt && \
    python setup_cuda.py install && \
    cd .. && \
    git clone https://github.com/johnsmith0031/alpaca_lora_4bit && \
    pip install git+https://github.com/sterlind/GPTQ-for-LLaMa.git@lora_4bit && \
    pip3 install --upgrade accelerate transformers[torch] && \
    pip3 install 'jupyterlab' && \
    mkdir /home/webui/jupyter && \
    chown -R webui:webui /home/webui

COPY --chown=webui:webui docker-entrypoint.sh /home/webui/docker-entrypoint.sh
COPY --chown=webui:webui settings.yaml /home/webui/text-generation-webui/settings.yaml
COPY --chown=webui:webui OpenOrca.yaml /home/webui/text-generation-webui/instruction-templates/OpenOrca.yaml
COPY --chown=webui:webui ChatML.yaml /home/webui/text-generation-webui/instruction-templates/ChatML.yaml
COPY --chown=webui:webui Blank.yaml /home/webui/text-generation-webui/instruction-templates/Blank.yaml
COPY --chown=webui:webui Vicuna-Short.yaml /home/webui/text-generation-webui/instruction-templates/Vicuna-Short.yaml
COPY --chown=webui:webui Alpaca-InstructOnly.yaml /home/webui/text-generation-webui/instruction-templates/Alpaca-InstructOnly.yaml
COPY --chown=webui:webui Zephyr.yaml /home/webui/text-generation-webui/instruction-templates/Zephyr.yaml
COPY --chown=webui:webui DeepSeek.yaml /home/webui/text-generation-webui/instruction-templates/DeepSeek.yaml

USER webui

VOLUME /home/webui/text-generation-webui/models
VOLUME /home/webui/text-generation-webui/loras
VOLUME /home/webui/text-generation-webui/prompts
VOLUME /home/webui/text-generation-webui/softprompts

EXPOSE 8080 5001 8888

ENTRYPOINT ["/home/webui/docker-entrypoint.sh"]
