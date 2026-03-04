FROM ubuntu:24.04
ENV DEBIAN_FRONTEND=noninteractive

ENV NIM_VERSION=1.6.12

ARG URL=https://github.com/nim-lang/nightlies/releases/download/2023-03-10-version-1-6-1aa9273640c0c51486cf3a7b67282fe58f360e91/nim-1.6.12-linux_arm64.tar.xz
ARG SHA=DC2C8B1379FF07F5ED9DC297FA76BC4424C4E0BFDD7C05117C4A646DDA89AF6F

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
