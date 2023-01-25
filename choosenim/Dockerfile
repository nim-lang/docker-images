FROM bitnami/minideb

RUN apt update
RUN install_packages openssl curl xz-utils ca-certificates gcc

WORKDIR /root/
RUN curl https://nim-lang.org/choosenim/init.sh -sSf | bash -s -- -y
ENV PATH=/root/.nimble/bin:$PATH

RUN apt -y autoclean
RUN apt -y clean
RUN rm -r /tmp/*