FROM node:lts-trixie

ENV NIM_VERSION=2.0.0
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
    amd64) url='https://github.com/nim-lang/nightlies/releases/download/2023-08-01-version-2-0-a488067a4130f029000be4550a0fb1b39e0e9e7c/nim-2.0.0-linux_x64.tar.xz'; sha256='CA1FFEC35439A02B3102FAF1C1CAF5A033F929832B7FA2C76B3A6A7216F14F01' ;; \
    arm64) url='https://github.com/nim-lang/nightlies/releases/download/2023-08-01-version-2-0-a488067a4130f029000be4550a0fb1b39e0e9e7c/nim-2.0.0-linux_arm64.tar.xz'; sha256='96C2B96C68CA598720B4E6048E4D89B88F47612E7F7887F7B6DA734270EB00E2' ;; \
    armhf) url='https://github.com/nim-lang/nightlies/releases/download/2023-08-01-version-2-0-a488067a4130f029000be4550a0fb1b39e0e9e7c/nim-2.0.0-linux_armv7l.tar.xz'; sha256='812B6264E4B33FFF7356E648438DC4BCFB0A78A945F7F1A0B8314427AFC20FE0' ;; \
    *) echo >&2 "error: unsupported architecture: ${dpkgArch}"; exit 1 ;; \
  esac; \
  curl --fail --location "$url" --output nim.tar.xz; \
  echo "$sha256 *nim.tar.xz" | sha256sum --check --strict -; \
  mkdir -p /opt/nim; \
  tar -xJf nim.tar.xz --strip-components=1 --directory /opt/nim "nim-${NIM_VERSION}"; \
  rm nim.tar.xz; \
  nim --version

WORKDIR /usr/src/app
