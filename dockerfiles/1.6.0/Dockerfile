FROM node:lts-trixie

ENV NIM_VERSION=1.6.0
ENV PATH="/opt/nim/bin:${PATH}"

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
  apt-get dist-clean

WORKDIR /tmp

RUN set -eux; \
  dpkgArch="$(dpkg --print-architecture)"; \
  case "${dpkgArch}" in \
    amd64) url='https://github.com/nim-lang/nightlies/releases/download/2021-10-19-version-1-6-727c6378d2464090564dbcd9bc8b9ac648467e38/nim-1.6.0-linux_x64.tar.xz'; sha256='4B7CB85F49E155F466B03435208239BA87EAB605FF6BADA2A63FDFF294D3D3C4' ;; \
    arm64) url='https://github.com/nim-lang/nightlies/releases/download/2021-10-19-version-1-6-727c6378d2464090564dbcd9bc8b9ac648467e38/nim-1.6.0-linux_arm64.tar.xz'; sha256='DD0E9DC3A093D751782008DEC81258F02208CD72279067325EFE5C560A1362DD' ;; \
    armhf) url='https://github.com/nim-lang/nightlies/releases/download/2021-10-19-version-1-6-727c6378d2464090564dbcd9bc8b9ac648467e38/nim-1.6.0-linux_armv7l.tar.xz'; sha256='204030474CCA6E9B091E24A66480770258427509D84F469F7749B5400D5747C5' ;; \
    *) echo >&2 "error: unsupported architecture: ${dpkgArch}"; exit 1 ;; \
  esac; \
  curl --fail --location "$url" --output nim.tar.xz; \
  echo "$sha256 *nim.tar.xz" | sha256sum --check --strict -; \
  mkdir -p /opt/nim; \
  tar -xJf nim.tar.xz --strip-components=1 --directory /opt/nim "nim-${NIM_VERSION}"; \
  rm nim.tar.xz; \
  nim --version

WORKDIR /usr/src/app
