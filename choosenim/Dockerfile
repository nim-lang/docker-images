FROM bitnami/minideb

RUN apt-get update && apt-get install -y curl xz-utils gcc openssl ca-certificates

WORKDIR /root/
RUN curl https://nim-lang.org/choosenim/init.sh -sSf | bash -s -- -y
ENV PATH=/root/.nimble/bin:$PATH

RUN apt -y autoremove
RUN apt -y autoclean
RUN apt -y clean
RUN rm -r /tmp/*