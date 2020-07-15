FROM nvidia/cuda:10.2-runtime-ubuntu18.04
LABEL maintainer="choa.james@gmail.com"

RUN apt -y update && \
    apt -y upgrade && \
    apt -y install \
      python3 \
      python3-pip \
      build-essential \
      bash \
      git

WORKDIR /src
COPY requirements.txt .
RUN pip3 install -r requirements.txt

# mlflow ui
EXPOSE 5000

ENTRYPOINT ["/bin/bash"]
