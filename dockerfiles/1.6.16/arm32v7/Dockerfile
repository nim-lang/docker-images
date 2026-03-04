FROM ubuntu:24.04
ENV DEBIAN_FRONTEND=noninteractive

ENV NIM_VERSION=1.6.16

ARG URL=https://github.com/nim-lang/nightlies/releases/download/2023-10-10-version-1-6-3c9b68dc157804885b14a1984efc25e8b7cc861d/nim-1.6.16-linux_armv7l.tar.xz
ARG SHA=52B8A15DFBD69EDA0DB7B793F1D6345B1A8A085019B1BA75CB48A5BB70ED4D4A

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
