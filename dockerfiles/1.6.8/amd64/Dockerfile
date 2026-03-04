FROM ubuntu:24.04
ENV DEBIAN_FRONTEND=noninteractive

ENV NIM_VERSION=1.6.8

ARG URL=https://github.com/nim-lang/nightlies/releases/download/2022-09-27-version-1-6-c9f46ca8c9eeca8b5f68591b1abe14b962f80a4c/nim-1.6.8-linux_x64.tar.xz
ARG SHA=2263C5F451FBC5D00E07B817F86D05AE768349822496D1259AD5383E1691DE9B

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
