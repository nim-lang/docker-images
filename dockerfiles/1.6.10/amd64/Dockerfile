FROM ubuntu:24.04
ENV DEBIAN_FRONTEND=noninteractive

ENV NIM_VERSION=1.6.10

ARG URL=https://github.com/nim-lang/nightlies/releases/download/2022-11-21-version-1-6-f1519259f85cbdf2d5ff617c6a5534fcd2ff6942/nim-1.6.10-linux_x64.tar.xz
ARG SHA=2CDF8F4666F731A0197805FA16E147C739E47FBBCED35C1D3D1FA33D8659EFC3

RUN apt-get update && apt-get install -y --no-install-recommends \
  gcc g++ libc6-dev git nodejs ca-certificates openssl curl xz-utils \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /tmp

RUN curl -L "$URL" -o nim.tar.xz && \
  echo "${SHA}  nim.tar.xz" | sha256sum -c - && \
  tar -xJf nim.tar.xz && \
  mv nim-${NIM_VERSION} /opt/nim && \
  rm nim.tar.xz

ENV PATH="/root/.nimble/bin:/opt/nim/bin:${PATH}"
WORKDIR /usr/src/app
CMD ["nim", "--help"]
