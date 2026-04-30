FROM node:lts-trixie

ENV NIM_VERSION=1.6.16
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
    amd64) url='https://github.com/nim-lang/nightlies/releases/download/2023-10-10-version-1-6-3c9b68dc157804885b14a1984efc25e8b7cc861d/nim-1.6.16-linux_x64.tar.xz'; sha256='680B2AA5D2E39A0692CCC48583CA8697384C5C053BAC1F2D8D3C6C88640F5DFB' ;; \
    arm64) url='https://github.com/nim-lang/nightlies/releases/download/2023-10-10-version-1-6-3c9b68dc157804885b14a1984efc25e8b7cc861d/nim-1.6.16-linux_arm64.tar.xz'; sha256='182D978AC59BD69399BE88207D42DC023025165799988BA3622C114731636296' ;; \
    armhf) url='https://github.com/nim-lang/nightlies/releases/download/2023-10-10-version-1-6-3c9b68dc157804885b14a1984efc25e8b7cc861d/nim-1.6.16-linux_armv7l.tar.xz'; sha256='52B8A15DFBD69EDA0DB7B793F1D6345B1A8A085019B1BA75CB48A5BB70ED4D4A' ;; \
    *) echo >&2 "error: unsupported architecture: ${dpkgArch}"; exit 1 ;; \
  esac; \
  curl --fail --location "$url" --output nim.tar.xz; \
  echo "$sha256 *nim.tar.xz" | sha256sum --check --strict -; \
  mkdir -p /opt/nim; \
  tar -xJf nim.tar.xz --strip-components=1 --directory /opt/nim "nim-${NIM_VERSION}"; \
  rm nim.tar.xz; \
  nim --version

WORKDIR /usr/src/app
