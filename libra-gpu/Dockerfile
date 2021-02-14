FROM tensorflow/tensorflow:2.4.1-gpu-jupyter
LABEL maintainer="choa.james@gmail.com"

ENV LC_ALL=C.UTF-8 \
    LANG=C.UTF-8

RUN apt -y update && \
    apt -y upgrade && \
    apt -y install \
      libxrender1 \
      libxext6 \
      libsm6 && \
    apt -y clean all

WORKDIR /src
COPY requirements.txt .
RUN pip3 install -r requirements.txt

# mlflow ui
EXPOSE 5000

CMD ["/bin/bash"]
