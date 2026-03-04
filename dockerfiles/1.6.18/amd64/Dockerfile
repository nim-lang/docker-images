FROM ubuntu:24.04
ENV DEBIAN_FRONTEND=noninteractive

ENV NIM_VERSION=1.6.18

ARG URL=https://github.com/nim-lang/nightlies/releases/download/2023-12-15-version-1-6-a749a8b742bd0a4272c26a65517275db4720e58a/nim-1.6.18-linux_x64.tar.xz
ARG SHA=B2852FC9A54DA97BF51231324F1F2BD2B44B617F99327394658E62F8C476FA2D

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
