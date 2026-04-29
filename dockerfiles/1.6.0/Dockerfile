FROM node:lts-noble

ENV NIM_VERSION=1.6.0

ARG URL_AMD64=https://github.com/nim-lang/nightlies/releases/download/2021-10-19-version-1-6-727c6378d2464090564dbcd9bc8b9ac648467e38/nim-1.6.0-linux_x64.tar.xz
ARG SHA_AMD64=4B7CB85F49E155F466B03435208239BA87EAB605FF6BADA2A63FDFF294D3D3C4

ARG URL_ARM64=https://github.com/nim-lang/nightlies/releases/download/2021-10-19-version-1-6-727c6378d2464090564dbcd9bc8b9ac648467e38/nim-1.6.0-linux_arm64.tar.xz
ARG SHA_ARM64=DD0E9DC3A093D751782008DEC81258F02208CD72279067325EFE5C560A1362DD

ARG URL_ARMV7=https://github.com/nim-lang/nightlies/releases/download/2021-10-19-version-1-6-727c6378d2464090564dbcd9bc8b9ac648467e38/nim-1.6.0-linux_armv7l.tar.xz
ARG SHA_ARMV7=204030474CCA6E9B091E24A66480770258427509D84F469F7749B5400D5747C5

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
