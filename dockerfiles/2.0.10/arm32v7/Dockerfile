FROM ubuntu:24.04
ENV DEBIAN_FRONTEND=noninteractive

ENV NIM_VERSION=2.0.10

ARG URL=https://github.com/nim-lang/nightlies/releases/download/2024-10-01-version-2-0-e941ee15be775fe3c46db1bed9b4f41c7dfb1334/nim-2.0.10-linux_armv7l.tar.xz
ARG SHA=E897FDCD470EFA80EC9CD83A5265F8066CCEC43FB564A5504307B4BF0E1724B6

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
