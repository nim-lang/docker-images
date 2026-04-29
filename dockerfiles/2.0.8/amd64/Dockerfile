FROM node:lts-noble

ENV NIM_VERSION=2.0.8

ARG URL_AMD64=https://github.com/nim-lang/nightlies/releases/download/2024-07-03-version-2-0-5935c3bfa9fec6505394867b23510eb5cbab3dbf/nim-2.0.8-linux_x64.tar.xz
ARG SHA_AMD64=C971320D391DB30917B3B61C471CFF4B3CD3CD883D4F7AF099D3C9018CC15683

ARG URL_ARM64=https://github.com/nim-lang/nightlies/releases/download/2024-07-03-version-2-0-5935c3bfa9fec6505394867b23510eb5cbab3dbf/nim-2.0.8-linux_arm64.tar.xz
ARG SHA_ARM64=144CAECAA5750BA7ACA52062322645FE6CB64063074168E0F459653C3A71FA7F

ARG URL_ARMV7=https://github.com/nim-lang/nightlies/releases/download/2024-07-03-version-2-0-5935c3bfa9fec6505394867b23510eb5cbab3dbf/nim-2.0.8-linux_armv7l.tar.xz
ARG SHA_ARMV7=6B588DC6F286D2F37F4BC75583B1DC5400377DEEC4DB7FA865915E6F681133E0

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
  rm -rf /var/lib/apt/lists/*

WORKDIR /tmp

RUN set -eux; \
  dpkgArch="$(dpkg --print-architecture)"; \
  case "${dpkgArch}" in \
    amd64) URL="$URL_AMD64"; CHKSUM="$SHA_AMD64" ;; \
    arm64) URL="$URL_ARM64"; CHKSUM="$SHA_ARM64" ;; \
    armhf) URL="$URL_ARMV7"; CHKSUM="$SHA_ARMV7" ;; \
    *) echo >&2 "error: unsupported architecture: ${dpkgArch}"; exit 1 ;; \
  esac; \
  if [ "$URL" = "none" ] || [ -z "$URL" ]; then \
    echo >&2 "error: Nim binary not available for ${dpkgArch} in version ${NIM_VERSION}"; \
    exit 1; \
  fi; \
  curl --fail --location "$URL" --output nim.tar.xz; \
  echo "${CHKSUM}  nim.tar.xz" | sha256sum -c -; \
  tar -xJf nim.tar.xz; \
  mv "nim-${NIM_VERSION}" /opt/nim; \
  rm nim.tar.xz; \
  /opt/nim/bin/nim --version

ENV PATH="/opt/nim/bin:${PATH}"
WORKDIR /usr/src/app
CMD ["nim", "--help"]
