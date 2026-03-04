FROM ubuntu:24.04
ENV DEBIAN_FRONTEND=noninteractive

ENV NIM_VERSION=1.6.2

ARG URL=https://github.com/nim-lang/nightlies/releases/download/2021-12-17-version-1-6-9084d9bc02bcd983b81a4c76a05f27b9ce2707dd/nim-1.6.2-linux_arm64.tar.xz
ARG SHA=89E772E3E7773D2A21FB7C2498110BAE09E3C6167591AED502C8D34FA7CFBBC4

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
