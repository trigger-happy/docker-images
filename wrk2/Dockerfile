FROM ubuntu:22.04 as base
LABEL maintainer="choa.james@gmail.com"

RUN apt -y update && \
    apt -y install \
      git \
      gcc \
      make \
      libssl-dev \
      libz-dev 

RUN mkdir -p /src && \
    git clone https://github.com/giltene/wrk2.git && \
    cd wrk2 && \
    make -j4 && \
    cp wrk /usr/bin/wrk && \
    cd .. && rm -rf wrk2

CMD ["/bin/bash"]
