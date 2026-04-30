FROM node:lts-trixie

ENV NIM_VERSION=1.6.18
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
    amd64) url='https://github.com/nim-lang/nightlies/releases/download/2023-12-15-version-1-6-a749a8b742bd0a4272c26a65517275db4720e58a/nim-1.6.18-linux_x64.tar.xz'; sha256='B2852FC9A54DA97BF51231324F1F2BD2B44B617F99327394658E62F8C476FA2D' ;; \
    arm64) url='https://github.com/nim-lang/nightlies/releases/download/2023-12-15-version-1-6-a749a8b742bd0a4272c26a65517275db4720e58a/nim-1.6.18-linux_arm64.tar.xz'; sha256='8AF221F8646C61A9067AD50DB932D597987F419D7AD7EF3033D078DBF06B97A8' ;; \
    armhf) url='https://github.com/nim-lang/nightlies/releases/download/2023-12-15-version-1-6-a749a8b742bd0a4272c26a65517275db4720e58a/nim-1.6.18-linux_armv7l.tar.xz'; sha256='C28A083F7535E9CDBE3C48DC0EFD7E3FD26221CF5C1667A0F9E149886A3C5B12' ;; \
    *) echo >&2 "error: unsupported architecture: ${dpkgArch}"; exit 1 ;; \
  esac; \
  curl --fail --location "$url" --output nim.tar.xz; \
  echo "$sha256 *nim.tar.xz" | sha256sum --check --strict -; \
  mkdir -p /opt/nim; \
  tar -xJf nim.tar.xz --strip-components=1 --directory /opt/nim "nim-${NIM_VERSION}"; \
  rm nim.tar.xz; \
  nim --version

WORKDIR /usr/src/app
