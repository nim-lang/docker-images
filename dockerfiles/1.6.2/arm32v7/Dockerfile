FROM node:lts-trixie

ENV NIM_VERSION=1.6.2
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
    amd64) url='https://github.com/nim-lang/nightlies/releases/download/2021-12-17-version-1-6-9084d9bc02bcd983b81a4c76a05f27b9ce2707dd/nim-1.6.2-linux_x64.tar.xz'; sha256='9E0C616FE504402E29E43D44708A49416DCBFA295CEE1883CE6E5BFB25C364F1' ;; \
    arm64) url='https://github.com/nim-lang/nightlies/releases/download/2021-12-17-version-1-6-9084d9bc02bcd983b81a4c76a05f27b9ce2707dd/nim-1.6.2-linux_arm64.tar.xz'; sha256='89E772E3E7773D2A21FB7C2498110BAE09E3C6167591AED502C8D34FA7CFBBC4' ;; \
    armhf) url='https://github.com/nim-lang/nightlies/releases/download/2021-12-17-version-1-6-9084d9bc02bcd983b81a4c76a05f27b9ce2707dd/nim-1.6.2-linux_armv7l.tar.xz'; sha256='A727D3882B6D28FFEE24BABB1EBE15C3262A0758D1CDAA15452C244DE106BB5C' ;; \
    *) echo >&2 "error: unsupported architecture: ${dpkgArch}"; exit 1 ;; \
  esac; \
  curl --fail --location "$url" --output nim.tar.xz; \
  echo "$sha256 *nim.tar.xz" | sha256sum --check --strict -; \
  mkdir -p /opt/nim; \
  tar -xJf nim.tar.xz --strip-components=1 --directory /opt/nim "nim-${NIM_VERSION}"; \
  rm nim.tar.xz; \
  nim --version

WORKDIR /usr/src/app
