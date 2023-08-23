FROM nvidia/cuda:11.8.0-devel-ubuntu22.04
LABEL maintainer="choa.james@gmail.com"

RUN useradd -mU comfyui

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

WORKDIR /home/comfyui

ENV LC_ALL=C.UTF-8 \
    LANG=C.UTF-8 \
    PORT=8188 \
    COMFYUI_REPO=https://github.com/comfyanonymous/ComfyUI.git \
    COMFYUI_REF=f2a7cc912186c89fda9580f36da28c7fc382ea26

ARG TORCH_CUDA_ARCH_LIST="8.6+PTX" \
    CUDA_VISIBLE_DEVICES=1

RUN git clone $COMFYUI_REPO && \
    cd ComfyUI && \
    git checkout $COMFYUI_REF && \
    pip3 install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu118 xformers && \
    pip3 install -r requirements.txt && \
    chown -R comfyui:comfyui /home/comfyui

COPY --chown=comfyui:comfyui docker-entrypoint.sh /home/comfyui/docker-entrypoint.sh

USER comfyui

VOLUME /home/comfyui/ComfyUI/models/checkpoints
VOLUME /home/comfyui/ComfyUI/models/clip
VOLUME /home/comfyui/ComfyUI/models/clip_vision
VOLUME /home/comfyui/ComfyUI/models/controlnet
VOLUME /home/comfyui/ComfyUI/models/diffusers
VOLUME /home/comfyui/ComfyUI/models/embeddings
VOLUME /home/comfyui/ComfyUI/models/gligen
VOLUME /home/comfyui/ComfyUI/models/hypernetworks
VOLUME /home/comfyui/ComfyUI/models/loras
VOLUME /home/comfyui/ComfyUI/models/style_models
VOLUME /home/comfyui/ComfyUI/models/unet
VOLUME /home/comfyui/ComfyUI/models/upscale_models
VOLUME /home/comfyui/ComfyUI/models/vae
VOLUME /home/comfyui/ComfyUI/models/vae_approx
VOLUME /home/comfyui/ComfyUI/outputs

EXPOSE 8188

ENTRYPOINT ["/home/comfyui/docker-entrypoint.sh"]
