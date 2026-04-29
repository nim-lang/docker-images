FROM node:lts-noble

ENV NIM_VERSION=1.6.10

ARG URL_AMD64=https://github.com/nim-lang/nightlies/releases/download/2022-11-21-version-1-6-f1519259f85cbdf2d5ff617c6a5534fcd2ff6942/nim-1.6.10-linux_x64.tar.xz
ARG SHA_AMD64=2CDF8F4666F731A0197805FA16E147C739E47FBBCED35C1D3D1FA33D8659EFC3

ARG URL_ARM64=https://github.com/nim-lang/nightlies/releases/download/2022-11-21-version-1-6-f1519259f85cbdf2d5ff617c6a5534fcd2ff6942/nim-1.6.10-linux_arm64.tar.xz
ARG SHA_ARM64=A9262AE3AE21B59B199C01063E582DBAD6BE5C9CB0A99ED9EABF12058163A1B1

ARG URL_ARMV7=https://github.com/nim-lang/nightlies/releases/download/2022-11-21-version-1-6-f1519259f85cbdf2d5ff617c6a5534fcd2ff6942/nim-1.6.10-linux_armv7l.tar.xz
ARG SHA_ARMV7=1D4769121944971F86173A1A44A8B0F6882C9A2FCA63B3B2136E963147C98F0F

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
