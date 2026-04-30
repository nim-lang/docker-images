FROM node:lts-trixie

ENV NIM_VERSION=2.2.6
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
    amd64) url='https://github.com/nim-lang/nightlies/releases/download/2025-10-31-version-2-2-ab00c56904e3126ad826bb520d243513a139436a/nim-2.2.6-linux_x64.tar.xz'; sha256='38B8407F87D78BD207390051E4C76F38A45D0A26983CB262017C899B56AD8D06' ;; \
    arm64) url='none'; sha256='0' ;; \
    armhf) url='https://github.com/nim-lang/nightlies/releases/download/2025-10-31-version-2-2-ab00c56904e3126ad826bb520d243513a139436a/nim-2.2.6-linux_armv7l.tar.xz'; sha256='F634A67559EE54485D4007E3547555C94E661BFD9463E932C821129E0BA08577' ;; \
    *) echo >&2 "error: unsupported architecture: ${dpkgArch}"; exit 1 ;; \
  esac; \
  curl --fail --location "$url" --output nim.tar.xz; \
  echo "$sha256 *nim.tar.xz" | sha256sum --check --strict -; \
  mkdir -p /opt/nim; \
  tar -xJf nim.tar.xz --strip-components=1 --directory /opt/nim "nim-${NIM_VERSION}"; \
  rm nim.tar.xz; \
  nim --version

WORKDIR /usr/src/app
