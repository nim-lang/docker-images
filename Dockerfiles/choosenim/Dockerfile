FROM bitnami/minideb

WORKDIR /root/

RUN apt-get update && \
  apt-get install -y curl xz-utils gcc openssl ca-certificates git && \
  curl https://nim-lang.org/choosenim/init.sh -sSf | bash -s -- -y && \
  apt -y autoremove && \
  apt -y clean && \
  rm -r /tmp/*
ENV PATH=/root/.nimble/bin:$PATH
