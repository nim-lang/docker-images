FROM node:lts-trixie

ENV NIM_VERSION=2.0.2
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
    amd64) url='https://github.com/nim-lang/nightlies/releases/download/2023-12-15-version-2-0-c4c44d10df8a14204a75c34e499def200589cb7c/nim-2.0.2-linux_x64.tar.xz'; sha256='047DDE8FF40B18628AC1188BAA9CA992D05F1F45C5121D1D07A76224F06E1551' ;; \
    arm64) url='https://github.com/nim-lang/nightlies/releases/download/2023-12-15-version-2-0-c4c44d10df8a14204a75c34e499def200589cb7c/nim-2.0.2-linux_arm64.tar.xz'; sha256='1888D1FFE41360E0ACCBD3547E0699C8B9781CD9E96FC1FF2692D8449D8168AC' ;; \
    armhf) url='https://github.com/nim-lang/nightlies/releases/download/2023-12-15-version-2-0-c4c44d10df8a14204a75c34e499def200589cb7c/nim-2.0.2-linux_armv7l.tar.xz'; sha256='31307C6E1489B68ED0B152D3C08AA5A57C6E9A3546B54B4B453F3B6145FB4CBB' ;; \
    *) echo >&2 "error: unsupported architecture: ${dpkgArch}"; exit 1 ;; \
  esac; \
  curl --fail --location "$url" --output nim.tar.xz; \
  echo "$sha256 *nim.tar.xz" | sha256sum --check --strict -; \
  mkdir -p /opt/nim; \
  tar -xJf nim.tar.xz --strip-components=1 --directory /opt/nim "nim-${NIM_VERSION}"; \
  rm nim.tar.xz; \
  nim --version

WORKDIR /usr/src/app
