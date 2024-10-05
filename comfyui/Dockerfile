FROM nvidia/cuda:12.4.1-devel-ubuntu22.04
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
      wget \
      curl \
      unzip \
      git && \
    apt -y clean all && \
    update-alternatives --install /usr/bin/python python /usr/bin/python3 10 && \
    update-alternatives --install /usr/bin/pip pip /usr/bin/pip3 10

WORKDIR /home/comfyui

ENV LC_ALL=C.UTF-8 \
    LANG=C.UTF-8 \
    PORT=8188 \
    COMFYUI_REPO=https://github.com/comfyanonymous/ComfyUI.git \
    COMFYUI_REF=6f021d8aa0261f7e61db6c6199d942c53a42a965

ARG TORCH_CUDA_ARCH_LIST="8.6+PTX" \
    CUDA_VISIBLE_DEVICES=1

RUN git clone $COMFYUI_REPO && \
    cd ComfyUI && \
    git checkout $COMFYUI_REF && \
    pip3 install torch torchvision torchaudio && \
    pip3 install -r requirements.txt && \
    cd custom_nodes && \
      git clone https://github.com/Fannovel16/comfyui_controlnet_aux.git && \
        cd comfyui_controlnet_aux && \
        pip install -r requirements.txt && \
        cd ../ && \
      git clone https://github.com/ltdrdata/ComfyUI-Manager.git && \
        cd ComfyUI-Manager && \
        pip install -r requirements.txt && \
        cd ../ && \
      git clone https://github.com/cubiq/ComfyUI_IPAdapter_plus.git && \
      git clone https://github.com/Acly/comfyui-tooling-nodes.git && \
      wget https://github.com/Acly/krita-ai-diffusion/releases/download/v0.1.0/ComfyUI_UltimateSDUpscale_6ea48202a76ccf5904ddfa85f826efa80dd50520.zip && \
      unzip ComfyUI_UltimateSDUpscale_6ea48202a76ccf5904ddfa85f826efa80dd50520.zip && \
      rm ComfyUI_UltimateSDUpscale_6ea48202a76ccf5904ddfa85f826efa80dd50520.zip && \
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
VOLUME /home/comfyui/ComfyUI/custom_nodes/ComfyUI_IPAdapter_plus/models

EXPOSE 8188

ENTRYPOINT ["/home/comfyui/docker-entrypoint.sh"]
