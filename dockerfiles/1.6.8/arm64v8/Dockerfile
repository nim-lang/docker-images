FROM ubuntu:24.04
ENV DEBIAN_FRONTEND=noninteractive

ENV NIM_VERSION=1.6.8

ARG URL=https://github.com/nim-lang/nightlies/releases/download/2022-09-27-version-1-6-c9f46ca8c9eeca8b5f68591b1abe14b962f80a4c/nim-1.6.8-linux_arm64.tar.xz
ARG SHA=C88EAC4BD8B87958696A8113600DD1E3497CA4642F014F667ABF37626925997F

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
