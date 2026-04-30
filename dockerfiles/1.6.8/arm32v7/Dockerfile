FROM node:lts-trixie

ENV NIM_VERSION=1.6.8
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
    amd64) url='https://github.com/nim-lang/nightlies/releases/download/2022-09-27-version-1-6-c9f46ca8c9eeca8b5f68591b1abe14b962f80a4c/nim-1.6.8-linux_x64.tar.xz'; sha256='2263C5F451FBC5D00E07B817F86D05AE768349822496D1259AD5383E1691DE9B' ;; \
    arm64) url='https://github.com/nim-lang/nightlies/releases/download/2022-09-27-version-1-6-c9f46ca8c9eeca8b5f68591b1abe14b962f80a4c/nim-1.6.8-linux_arm64.tar.xz'; sha256='C88EAC4BD8B87958696A8113600DD1E3497CA4642F014F667ABF37626925997F' ;; \
    armhf) url='https://github.com/nim-lang/nightlies/releases/download/2022-09-27-version-1-6-c9f46ca8c9eeca8b5f68591b1abe14b962f80a4c/nim-1.6.8-linux_armv7l.tar.xz'; sha256='A853E9F6BC163FC3AFE9C027C81B6C4DF3475430654762AAC918C08A1C558293' ;; \
    *) echo >&2 "error: unsupported architecture: ${dpkgArch}"; exit 1 ;; \
  esac; \
  curl --fail --location "$url" --output nim.tar.xz; \
  echo "$sha256 *nim.tar.xz" | sha256sum --check --strict -; \
  mkdir -p /opt/nim; \
  tar -xJf nim.tar.xz --strip-components=1 --directory /opt/nim "nim-${NIM_VERSION}"; \
  rm nim.tar.xz; \
  nim --version

WORKDIR /usr/src/app
