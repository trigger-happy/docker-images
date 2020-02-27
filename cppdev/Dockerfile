FROM fedora:31 as base

RUN useradd -mU builder
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
      cargo && \
    cargo install grcov && \
    mv /root/.cargo/bin/grcov /usr/bin/grcov && \
    chmod a+rx /usr/bin/grcov

RUN mkdir -p /app /src && chown builder:builder /app /src

VOLUME /app /src

WORKDIR /src
USER builder

CMD ["/bin/bash"]
