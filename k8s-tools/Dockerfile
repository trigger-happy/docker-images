FROM alpine:3.12.0

RUN apk update && \
    apk upgrade && \
    apk add \
      curl && \
    rm -rf /var/cache/apk

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
    chmod a+x kubectl && \
    mv kubectl /usr/bin/kubectl

RUN curl -JOL https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv3.8.1/kustomize_v3.8.1_linux_amd64.tar.gz && \
    tar xzf kustomize_v3.8.1_linux_amd64.tar.gz && \
    chmod a+x kustomize && \
    mv kustomize /usr/bin/kustomize

RUN adduser \
      --disabled-password \
      --gecos "" \
      --home "/home/k8s" \
      --shell "/bin/sh" \
      --uid 10000 \
      k8s

WORKDIR /home/k8s
USER k8s

CMD ["/bin/sh"]
