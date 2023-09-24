FROM nvidia/cuda:11.8.0-runtime-ubuntu22.04
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
    PORT=7861 \
    WEBUI_REF=5ef669de080814067961f28357256e8fe27544f4

ARG TORCH_CUDA_ARCH_LIST="8.6+PTX" \
    CUDA_VISIBLE_DEVICES=1

RUN git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git && \
    cd stable-diffusion-webui && \
    git checkout $WEBUI_REF && \
    pip3 install -r requirements.txt && \
    pip3 install xformers sqlalchemy && \
    python launch.py --exit --skip-torch-cuda-test && \
    mv models packaged_models && \
    mkdir -p models && \
    chown -R webui:webui /home/webui

COPY --chown=webui docker-entrypoint.sh /home/webui/docker-entrypoint.sh
COPY --chown=webui styles.csv /home/webui/stable-diffusion-webui/

USER webui

VOLUME /home/webui/stable-diffusion-webui/models
VOLUME /home/webui/stable-diffusion-webui/extensions
VOLUME /home/webui/stable-diffusion-webui/localizations
VOLUME /home/webui/stable-diffusion-webui/embeddings
VOLUME /home/webui/stable-diffusion-webui/repositories
VOLUME /home/webui/stable-diffusion-webui/outputs

EXPOSE 7861

ENTRYPOINT ["/home/webui/docker-entrypoint.sh"]
