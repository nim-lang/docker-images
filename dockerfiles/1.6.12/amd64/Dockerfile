FROM node:lts-noble

ENV NIM_VERSION=1.6.12

ARG URL_AMD64=https://github.com/nim-lang/nightlies/releases/download/2023-03-10-version-1-6-1aa9273640c0c51486cf3a7b67282fe58f360e91/nim-1.6.12-linux_x64.tar.xz
ARG SHA_AMD64=6B22894D0DB974E10BD271217CE7F01A5FCD0B37CB3EA9D539734CB46F2CAC75

ARG URL_ARM64=https://github.com/nim-lang/nightlies/releases/download/2023-03-10-version-1-6-1aa9273640c0c51486cf3a7b67282fe58f360e91/nim-1.6.12-linux_arm64.tar.xz
ARG SHA_ARM64=DC2C8B1379FF07F5ED9DC297FA76BC4424C4E0BFDD7C05117C4A646DDA89AF6F

ARG URL_ARMV7=https://github.com/nim-lang/nightlies/releases/download/2023-03-10-version-1-6-1aa9273640c0c51486cf3a7b67282fe58f360e91/nim-1.6.12-linux_armv7l.tar.xz
ARG SHA_ARMV7=11F6D38DEB3B75D2FD4AA46363FECB54C10119E6A27DEF8B8C4676F06BA0A209

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
