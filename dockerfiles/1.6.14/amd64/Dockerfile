FROM ubuntu:24.04
ENV DEBIAN_FRONTEND=noninteractive

ENV NIM_VERSION=1.6.14

ARG URL=https://github.com/nim-lang/nightlies/releases/download/2023-06-27-version-1-6-71ba2e7f3c5815d956b1ae0341b0743242b8fec6/nim-1.6.14-linux_x64.tar.xz
ARG SHA=1E7073C05600F2BE5F2D9018E73F4584F0369442455AB27521CA499B47EEF904

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
