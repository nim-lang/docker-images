FROM node:lts-trixie

ENV NIM_VERSION=1.6.12
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
    amd64) url='https://github.com/nim-lang/nightlies/releases/download/2023-03-10-version-1-6-1aa9273640c0c51486cf3a7b67282fe58f360e91/nim-1.6.12-linux_x64.tar.xz'; sha256='6B22894D0DB974E10BD271217CE7F01A5FCD0B37CB3EA9D539734CB46F2CAC75' ;; \
    arm64) url='https://github.com/nim-lang/nightlies/releases/download/2023-03-10-version-1-6-1aa9273640c0c51486cf3a7b67282fe58f360e91/nim-1.6.12-linux_arm64.tar.xz'; sha256='DC2C8B1379FF07F5ED9DC297FA76BC4424C4E0BFDD7C05117C4A646DDA89AF6F' ;; \
    armhf) url='https://github.com/nim-lang/nightlies/releases/download/2023-03-10-version-1-6-1aa9273640c0c51486cf3a7b67282fe58f360e91/nim-1.6.12-linux_armv7l.tar.xz'; sha256='11F6D38DEB3B75D2FD4AA46363FECB54C10119E6A27DEF8B8C4676F06BA0A209' ;; \
    *) echo >&2 "error: unsupported architecture: ${dpkgArch}"; exit 1 ;; \
  esac; \
  curl --fail --location "$url" --output nim.tar.xz; \
  echo "$sha256 *nim.tar.xz" | sha256sum --check --strict -; \
  mkdir -p /opt/nim; \
  tar -xJf nim.tar.xz --strip-components=1 --directory /opt/nim "nim-${NIM_VERSION}"; \
  rm nim.tar.xz; \
  nim --version

WORKDIR /usr/src/app
