FROM archlinux:latest as base

RUN pacman -Syu --noconfirm \
      gcc \
      make \
      flex \
      bison \
      gperf \
      ninja \
      ccache \
      dfu-util \
      libusb \
      neovim \
      python3 \
      cmake \
      git \
      python-numpy \
      ffmpeg \
      tbb \
      libdc1394 \
      libsm \
      wget \
      python-pip && \
    rm -rf /var/cache/pacman

WORKDIR /app

ENV IDF_GITHUB_ASSETS dl.espressif.com/github_assets

RUN mkdir -p ~/esp && \
    cd ~/esp && \
    git clone --recursive https://github.com/espressif/esp-idf.git && \
    cd esp-idf && ./install.sh

COPY entrypoint.sh /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["/bin/bash"]
