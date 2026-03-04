FROM ubuntu:24.04
ENV DEBIAN_FRONTEND=noninteractive

ENV NIM_VERSION=1.6.16

ARG URL=https://github.com/nim-lang/nightlies/releases/download/2023-10-10-version-1-6-3c9b68dc157804885b14a1984efc25e8b7cc861d/nim-1.6.16-linux_x64.tar.xz
ARG SHA=680B2AA5D2E39A0692CCC48583CA8697384C5C053BAC1F2D8D3C6C88640F5DFB

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
