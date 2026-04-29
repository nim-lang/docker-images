FROM node:lts-noble

ENV NIM_VERSION=1.6.4

ARG URL_AMD64=https://github.com/nim-lang/nightlies/releases/download/2022-02-09-version-1-6-7994556f3804c217035c44b453a3feec64405758/nim-1.6.4-linux_x64.tar.xz
ARG SHA_AMD64=23BCADD15335F5EEAC32F106254C4FD8E3E089CE62B29D6820AF75A2CC655E20

ARG URL_ARM64=https://github.com/nim-lang/nightlies/releases/download/2022-02-09-version-1-6-7994556f3804c217035c44b453a3feec64405758/nim-1.6.4-linux_arm64.tar.xz
ARG SHA_ARM64=1F1B03EC313300339B31B4A7007ABA21D8D3DEEF4A3A9F567507BE85780598A8

ARG URL_ARMV7=https://github.com/nim-lang/nightlies/releases/download/2022-02-09-version-1-6-7994556f3804c217035c44b453a3feec64405758/nim-1.6.4-linux_armv7l.tar.xz
ARG SHA_ARMV7=59E8C4AED67F049B16693F4CDFC4C3E5AC9067A0BBDF4CD7C13B6D035EFCFF49

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
