FROM docker:20.10.9
LABEL maintainer="choa.james@gmail.com"

WORKDIR /root
RUN wget https://github.com/docker/buildx/releases/download/v0.6.3/buildx-v0.6.3.linux-amd64 && \
    chmod a+x buildx-v0.6.3.linux-amd64 && \
    mkdir -p ~/.docker/cli-plugins && \
    mv buildx-v0.6.3.linux-amd64 ~/.docker/cli-plugins/docker-buildx

ENV DOCKER_CLI_EXPERIMENTAL=enabled
