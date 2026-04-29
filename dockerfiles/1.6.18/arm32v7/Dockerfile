FROM node:lts-noble

ENV NIM_VERSION=1.6.18

ARG URL_AMD64=https://github.com/nim-lang/nightlies/releases/download/2023-12-15-version-1-6-a749a8b742bd0a4272c26a65517275db4720e58a/nim-1.6.18-linux_x64.tar.xz
ARG SHA_AMD64=B2852FC9A54DA97BF51231324F1F2BD2B44B617F99327394658E62F8C476FA2D

ARG URL_ARM64=https://github.com/nim-lang/nightlies/releases/download/2023-12-15-version-1-6-a749a8b742bd0a4272c26a65517275db4720e58a/nim-1.6.18-linux_arm64.tar.xz
ARG SHA_ARM64=8AF221F8646C61A9067AD50DB932D597987F419D7AD7EF3033D078DBF06B97A8

ARG URL_ARMV7=https://github.com/nim-lang/nightlies/releases/download/2023-12-15-version-1-6-a749a8b742bd0a4272c26a65517275db4720e58a/nim-1.6.18-linux_armv7l.tar.xz
ARG SHA_ARMV7=C28A083F7535E9CDBE3C48DC0EFD7E3FD26221CF5C1667A0F9E149886A3C5B12

RUN set -eux; \
  apt-get update; \
  apt-get install -y --no-install-recommends \
    gcc \
    g++ \
    libc6-dev \
    git \
    ca-certificates \
    openssl \
    curl \
    xz-utils \
  ; \
  rm -rf /var/lib/apt/lists/*

WORKDIR /tmp

RUN set -eux; \
  dpkgArch="$(dpkg --print-architecture)"; \
  case "${dpkgArch}" in \
    amd64) URL="$URL_AMD64"; CHKSUM="$SHA_AMD64" ;; \
    arm64) URL="$URL_ARM64"; CHKSUM="$SHA_ARM64" ;; \
    armhf) URL="$URL_ARMV7"; CHKSUM="$SHA_ARMV7" ;; \
    *) echo >&2 "error: unsupported architecture: ${dpkgArch}"; exit 1 ;; \
  esac; \
  if [ "$URL" = "none" ] || [ -z "$URL" ]; then \
    echo >&2 "error: Nim binary not available for ${dpkgArch} in version ${NIM_VERSION}"; \
    exit 1; \
  fi; \
  curl --fail --location "$URL" --output nim.tar.xz; \
  echo "${CHKSUM}  nim.tar.xz" | sha256sum -c -; \
  tar -xJf nim.tar.xz; \
  mv "nim-${NIM_VERSION}" /opt/nim; \
  rm nim.tar.xz; \
  /opt/nim/bin/nim --version

ENV PATH="/opt/nim/bin:${PATH}"
WORKDIR /usr/src/app
CMD ["nim", "--help"]
