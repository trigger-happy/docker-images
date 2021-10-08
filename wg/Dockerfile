FROM fedora:34
LABEL maintainer="choa.james@gmail.com"

RUN dnf -y update && \
    dnf -y install \
      wireguard-tools \
      iproute \
      iptables && \
    dnf -y clean all

CMD exec /bin/bash -c "trap : TERM INT; sleep infinity & wait"
