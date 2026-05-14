FROM node:lts-trixie

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

ENV NIM_VERSION=2.0.2
ENV PATH="/opt/nim/bin:${PATH}"

WORKDIR /tmp

RUN set -eux; \
  dpkgArch="$(dpkg --print-architecture)"; \
  case "${dpkgArch}" in \
    amd64) url='https://github.com/nim-lang/nightlies/releases/download/2023-12-15-version-2-0-c4c44d10df8a14204a75c34e499def200589cb7c/nim-2.0.2-linux_x64.tar.xz'; sha256='047dde8ff40b18628ac1188baa9ca992d05f1f45c5121d1d07a76224f06e1551' ;; \
    arm64) url='https://github.com/nim-lang/nightlies/releases/download/2023-12-15-version-2-0-c4c44d10df8a14204a75c34e499def200589cb7c/nim-2.0.2-linux_arm64.tar.xz'; sha256='1888d1ffe41360e0accbd3547e0699c8b9781cd9e96fc1ff2692d8449d8168ac' ;; \
    *) echo >&2 "error: unsupported architecture: ${dpkgArch}"; exit 1 ;; \
  esac; \
  curl --fail --location "$url" --output nim.tar.xz; \
  echo "$sha256 *nim.tar.xz" | sha256sum --check --strict -; \
  mkdir -p /opt/nim; \
  tar -xJf nim.tar.xz --strip-components=1 --directory /opt/nim "nim-${NIM_VERSION}"; \
  rm nim.tar.xz; \
  nim --version

WORKDIR /usr/src/app

CMD ["bash"]
