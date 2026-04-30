FROM node:lts-trixie

ENV NIM_VERSION=1.6.6
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
    amd64) url='https://github.com/nim-lang/nightlies/releases/download/2022-05-05-version-1-6-0565a70eab02122ce278b98181c7d1170870865c/nim-1.6.6-linux_x64.tar.xz'; sha256='3E88DF45DBBEC2F083D31E00E6F2C07E0C70C392C91B2A934F7F283DD0FDF5F9' ;; \
    arm64) url='https://github.com/nim-lang/nightlies/releases/download/2022-05-05-version-1-6-0565a70eab02122ce278b98181c7d1170870865c/nim-1.6.6-linux_arm64.tar.xz'; sha256='862AD44F3650C63901877249D7A0E630E05A0E4DA91076AC4FB690F2AFA11F69' ;; \
    armhf) url='https://github.com/nim-lang/nightlies/releases/download/2022-05-05-version-1-6-0565a70eab02122ce278b98181c7d1170870865c/nim-1.6.6-linux_armv7l.tar.xz'; sha256='A60E9198C59FB6A45AEE114CB8E9B1F566ED06A5B4364A67C240A2D669310C89' ;; \
    *) echo >&2 "error: unsupported architecture: ${dpkgArch}"; exit 1 ;; \
  esac; \
  curl --fail --location "$url" --output nim.tar.xz; \
  echo "$sha256 *nim.tar.xz" | sha256sum --check --strict -; \
  mkdir -p /opt/nim; \
  tar -xJf nim.tar.xz --strip-components=1 --directory /opt/nim "nim-${NIM_VERSION}"; \
  rm nim.tar.xz; \
  nim --version

WORKDIR /usr/src/app
