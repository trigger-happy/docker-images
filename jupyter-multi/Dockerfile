FROM ubuntu:22.04 as base
LABEL maintainer="choa.james@gmail.com"

ARG RUST_HOST=x86_64-unknown-linux-gnu \
    RUST_TARGET=x86_64-unknown-linux-gnu \
    RUST_TOOLCHAIN=stable \
    GO_VERSION=1.22.0

ENV PYTHONUNBUFFERED=1 \
    DEBIAN_FRONTEND=noninteractive \
    LC_ALL=C.UTF-8 \
    LANG=C.UTF-8

RUN apt -y update && \
    apt -y upgrade && \
    apt -y install \
      curl \
      python3 \
      python3-pip \
      python3-venv \
      build-essential \
      bash \
      sudo \
      ninja-build \
      neovim \
      lld \
      pkg-config \
      git \
      ca-certificates \
      git-lfs && \
    apt -y clean all && \
    update-alternatives --install /usr/bin/python python /usr/bin/python3 10 && \
    update-alternatives --install /usr/bin/pip pip /usr/bin/pip3 10

# Giving sudo access to the user just in case there's a need to do some package management
RUN useradd -mU jupyter -s /bin/bash && \
    usermod -aG sudo jupyter && \
    echo "%sudo   ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    mkdir -p /home/jupyter/data && \
    chown jupyter:jupyter /home/jupyter/data

# Install Go
RUN curl -JOL https://go.dev/dl/go$GO_VERSION.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go$GO_VERSION.linux-amd64.tar.gz && \
    rm go$GO_VERSION.linux-amd64.tar.gz

USER jupyter
WORKDIR /home/jupyter

# Install Rust components
RUN curl -JOL https://sh.rustup.rs && \
    bash ./rustup-init.sh --default-host $RUST_HOST --target $RUST_TARGET --default-toolchain $RUST_TOOLCHAIN --profile default -y && \
    ~/.cargo/bin/cargo install --locked evcxr_jupyter && \
    ~/.cargo/bin/evcxr_jupyter --install && \
    ~/.cargo/bin/rustup component add rust-src && \
    mkdir -p ~/.local/share/bash-completion/completions && \
    ~/.cargo/bin/rustup completions bash > ~/.local/share/bash-completion/completions/rustup && \
    ~/.cargo/bin/rustup completions bash cargo > ~/.local/share/bash-completion/completions/cargo


COPY --chown=jupyter:jupyter docker-entrypoint.sh /home/jupyter/docker-entrypoint.sh
COPY --chown=jupyter:jupyter requirements.txt /home/jupyter/requirements.txt

VOLUME /home/jupyter/data
EXPOSE 8888

ENTRYPOINT ["/home/jupyter/docker-entrypoint.sh"]
