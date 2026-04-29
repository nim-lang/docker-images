FROM node:lts-noble

ENV NIM_VERSION=2.0.4

ARG URL_AMD64=https://github.com/nim-lang/nightlies/releases/download/2024-03-28-version-2-0-b47747d31844c6bd9af4322efe55e24fefea544c/nim-2.0.4-linux_x64.tar.xz
ARG SHA_AMD64=2CA6E7B701BDFEE2E7A8DEF2F0F5EEBA026420C612261FAA3D4A85BE04C679B5

ARG URL_ARM64=https://github.com/nim-lang/nightlies/releases/download/2024-03-28-version-2-0-b47747d31844c6bd9af4322efe55e24fefea544c/nim-2.0.4-linux_arm64.tar.xz
ARG SHA_ARM64=A907ADC2EF294D632969877438A5643FFAD7B03995D947381B01630FE444F3A4

ARG URL_ARMV7=https://github.com/nim-lang/nightlies/releases/download/2024-03-28-version-2-0-b47747d31844c6bd9af4322efe55e24fefea544c/nim-2.0.4-linux_armv7l.tar.xz
ARG SHA_ARMV7=FDA40D94E88859FCD66892A3780D8B4EF818E795074AAE331BE187C88FFBB4F9

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
