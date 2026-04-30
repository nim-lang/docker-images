FROM node:lts-trixie

ENV NIM_VERSION=2.2.8
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
    amd64) url='https://github.com/nim-lang/nightlies/releases/download/2026-02-23-version-2-2-4f500679b196fad944caa50a753f5bbfaefda001/nim-2.2.8-linux_x64.tar.xz'; sha256='EED763D0F8ED849781198FE18730638EB520E5ADA81D8BC916F8D3C1B256DD6E' ;; \
    arm64) url='https://github.com/nim-lang/nightlies/releases/download/2026-02-23-version-2-2-4f500679b196fad944caa50a753f5bbfaefda001/nim-2.2.8-linux_arm64.tar.xz'; sha256='19D8F79B054D40F41BB125EE5DD7867B446E7EA386D96A703D835159E3237301' ;; \
    armhf) url='https://github.com/nim-lang/nightlies/releases/download/2026-02-23-version-2-2-4f500679b196fad944caa50a753f5bbfaefda001/nim-2.2.8-linux_armv7l.tar.xz'; sha256='56B5102261CDC9485E374EFFC0B8E0F4600915BDB349F30380C06FE8281F57FE' ;; \
    *) echo >&2 "error: unsupported architecture: ${dpkgArch}"; exit 1 ;; \
  esac; \
  curl --fail --location "$url" --output nim.tar.xz; \
  echo "$sha256 *nim.tar.xz" | sha256sum --check --strict -; \
  mkdir -p /opt/nim; \
  tar -xJf nim.tar.xz --strip-components=1 --directory /opt/nim "nim-${NIM_VERSION}"; \
  rm nim.tar.xz; \
  nim --version

WORKDIR /usr/src/app
