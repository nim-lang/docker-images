FROM node:lts-trixie

ENV NIM_VERSION=1.6.10
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
    amd64) url='https://github.com/nim-lang/nightlies/releases/download/2022-11-21-version-1-6-f1519259f85cbdf2d5ff617c6a5534fcd2ff6942/nim-1.6.10-linux_x64.tar.xz'; sha256='2CDF8F4666F731A0197805FA16E147C739E47FBBCED35C1D3D1FA33D8659EFC3' ;; \
    arm64) url='https://github.com/nim-lang/nightlies/releases/download/2022-11-21-version-1-6-f1519259f85cbdf2d5ff617c6a5534fcd2ff6942/nim-1.6.10-linux_arm64.tar.xz'; sha256='A9262AE3AE21B59B199C01063E582DBAD6BE5C9CB0A99ED9EABF12058163A1B1' ;; \
    armhf) url='https://github.com/nim-lang/nightlies/releases/download/2022-11-21-version-1-6-f1519259f85cbdf2d5ff617c6a5534fcd2ff6942/nim-1.6.10-linux_armv7l.tar.xz'; sha256='1D4769121944971F86173A1A44A8B0F6882C9A2FCA63B3B2136E963147C98F0F' ;; \
    *) echo >&2 "error: unsupported architecture: ${dpkgArch}"; exit 1 ;; \
  esac; \
  curl --fail --location "$url" --output nim.tar.xz; \
  echo "$sha256 *nim.tar.xz" | sha256sum --check --strict -; \
  mkdir -p /opt/nim; \
  tar -xJf nim.tar.xz --strip-components=1 --directory /opt/nim "nim-${NIM_VERSION}"; \
  rm nim.tar.xz; \
  nim --version

WORKDIR /usr/src/app
