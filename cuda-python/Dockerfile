FROM nvidia/cuda:11.4.2-runtime-ubuntu20.04
LABEL maintainer="choa.james@gmail.com"

ENV LC_ALL=C.UTF-8 \
    LANG=C.UTF-8

RUN apt -y update && \
    apt -y upgrade && \
    apt -y install \
      python3 \
      python3-pip \
      build-essential \
      bash \
      git && \
    apt -y clean all && \
    update-alternatives --install /usr/bin/python python /usr/bin/python3 10 && \
    update-alternatives --install /usr/bin/pip pip /usr/bin/pip3 10

WORKDIR /src
COPY requirements.txt .
RUN pip3 install -r requirements.txt

# mlflow ui
EXPOSE 5000

CMD ["/bin/bash"]
