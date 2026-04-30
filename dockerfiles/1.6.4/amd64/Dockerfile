FROM node:lts-trixie

ENV NIM_VERSION=1.6.4
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
    amd64) url='https://github.com/nim-lang/nightlies/releases/download/2022-02-09-version-1-6-7994556f3804c217035c44b453a3feec64405758/nim-1.6.4-linux_x64.tar.xz'; sha256='23BCADD15335F5EEAC32F106254C4FD8E3E089CE62B29D6820AF75A2CC655E20' ;; \
    arm64) url='https://github.com/nim-lang/nightlies/releases/download/2022-02-09-version-1-6-7994556f3804c217035c44b453a3feec64405758/nim-1.6.4-linux_arm64.tar.xz'; sha256='1F1B03EC313300339B31B4A7007ABA21D8D3DEEF4A3A9F567507BE85780598A8' ;; \
    armhf) url='https://github.com/nim-lang/nightlies/releases/download/2022-02-09-version-1-6-7994556f3804c217035c44b453a3feec64405758/nim-1.6.4-linux_armv7l.tar.xz'; sha256='59E8C4AED67F049B16693F4CDFC4C3E5AC9067A0BBDF4CD7C13B6D035EFCFF49' ;; \
    *) echo >&2 "error: unsupported architecture: ${dpkgArch}"; exit 1 ;; \
  esac; \
  curl --fail --location "$url" --output nim.tar.xz; \
  echo "$sha256 *nim.tar.xz" | sha256sum --check --strict -; \
  mkdir -p /opt/nim; \
  tar -xJf nim.tar.xz --strip-components=1 --directory /opt/nim "nim-${NIM_VERSION}"; \
  rm nim.tar.xz; \
  nim --version

WORKDIR /usr/src/app
