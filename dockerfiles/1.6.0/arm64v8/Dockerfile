FROM ubuntu:24.04
ENV DEBIAN_FRONTEND=noninteractive

ENV NIM_VERSION=1.6.0

ARG URL=https://github.com/nim-lang/nightlies/releases/download/2021-10-19-version-1-6-727c6378d2464090564dbcd9bc8b9ac648467e38/nim-1.6.0-linux_arm64.tar.xz
ARG SHA=DD0E9DC3A093D751782008DEC81258F02208CD72279067325EFE5C560A1362DD

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
