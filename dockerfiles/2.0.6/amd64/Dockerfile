FROM ubuntu:24.04
ENV DEBIAN_FRONTEND=noninteractive

ENV NIM_VERSION=2.0.6

ARG URL=https://github.com/nim-lang/nightlies/releases/download/2024-06-17-version-2-0-c00e8e71e0c8465b5a5257c76c674b803273b222/nim-2.0.6-linux_x64.tar.xz
ARG SHA=4613C18F6C70D14F7FCBCB0C644425699862902EC64D7B785EDEDAF161815CDC

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
