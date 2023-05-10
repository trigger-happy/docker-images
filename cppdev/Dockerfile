FROM fedora:37 as base
LABEL maintainer="choa.james@gmail.com"

ARG VCPKG_VERSION=2023.04.15

RUN dnf -y update

RUN dnf -y groupinstall "C Development Tools and Libraries" "Development Tools" && \
    dnf -y install \
      cmake \
      clang-libs \
      clang-tools-extra \
      clang-analyzer \
      clang \
      ninja-build \
      libstdc++-static \
      libstdc++-devel \
      glibc-static \
      glibc-devel \
      make \
      llvm \
      cargo \
      which \
      python3-pip && \
    cargo install grcov && \
    mv /root/.cargo/bin/grcov /usr/bin/grcov && \
    chmod a+rx /usr/bin/grcov

RUN mkdir -p /app /src

VOLUME /src

WORKDIR /src

RUN pip install conan && \
    conan remote add conan-transit https://conan-transit.bintray.com && \
    conan remote add bincrafters https://api.bintray.com/conan/bincrafters/public-conan

RUN cd / && \
    git clone -b $VCPKG_VERSION https://github.com/microsoft/vcpkg.git && \
    cd vcpkg && \
    ./bootstrap-vcpkg.sh -disableMetrics && \
    ./vcpkg integrate install && \
    ./vcpkg integrate bash

ENV PATH=$PATH:/vcpkg

CMD ["/bin/bash"]
