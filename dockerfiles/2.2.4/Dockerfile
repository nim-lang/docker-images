FROM debian:bookworm-slim

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

ENV NIM_VERSION=2.2.4
ENV PATH="/opt/nim/bin:${PATH}"
ENV PATH="/root/.nimble/bin:${PATH}"

WORKDIR /tmp

RUN set -eux; \
  dpkgArch="$(dpkg --print-architecture)"; \
  case "${dpkgArch}" in \
    amd64) url='https://github.com/nim-lang/nightlies/releases/download/2025-04-22-version-2-2-f7145dd26efeeeb6eeae6fff649db244d81b212d/nim-2.2.4-linux_x64.tar.xz'; sha256='791802138aaf19c8579232c50b4998ce2ae2928b791127ce5b4ef3c7af53fb46' ;; \
    arm64) url='https://github.com/nim-lang/nightlies/releases/download/2025-04-22-version-2-2-f7145dd26efeeeb6eeae6fff649db244d81b212d/nim-2.2.4-linux_arm64.tar.xz'; sha256='62b9cc99c8e3e5fe6c7b0f6657cb7a656822066a527344aab6c1c1dbc61cc0fe' ;; \
    i386) url='https://github.com/nim-lang/nightlies/releases/download/2025-04-22-version-2-2-f7145dd26efeeeb6eeae6fff649db244d81b212d/nim-2.2.4-linux_x32.tar.xz'; sha256='4548e643996a8e38cc4532e38e1bd5fbb36ff76407866ea317307568389a3af2' ;; \
    armhf) url='https://github.com/nim-lang/nightlies/releases/download/2025-04-22-version-2-2-f7145dd26efeeeb6eeae6fff649db244d81b212d/nim-2.2.4-linux_armv7l.tar.xz'; sha256='797f72ee82301c954c801dafa4e7ae30762c1d8fde092efc9a749847ab2add97' ;; \
    *) echo >&2 "error: unsupported architecture: ${dpkgArch}"; exit 1 ;; \
  esac; \
  curl --fail --location "$url" --output nim.tar.xz; \
  echo "$sha256 *nim.tar.xz" | sha256sum --check --strict -; \
  mkdir -p /opt/nim; \
  tar -xJf nim.tar.xz --strip-components=1 --directory /opt/nim "nim-2.2.4"; \
  rm nim.tar.xz; \
  nim --version

WORKDIR /usr/src/app

CMD ["bash"]
