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
    libpcre3-dev libpcre3 \
  ; \
  rm -rf /var/lib/apt/lists/*

ENV NIM_VERSION=2.4.0
ENV PATH="/opt/nim/bin:${PATH}"
ENV PATH="/root/.nimble/bin:${PATH}"

WORKDIR /tmp

RUN set -eux; \
  dpkgArch="$(dpkg --print-architecture)"; \
  case "${dpkgArch}" in \
    amd64) url='https://github.com/nim-lang/nightlies/releases/download/2026-10-28-version-2-4-14991af742d0833503741fd9a0918133d1bcf8a4/nim-2.4.0-linux_x64.tar.xz'; sha256='23c1c83d9031c498a2b3ad0bce153b8905710d04eb5922cf8ebd8f9d12125743' ;; \
    i386) url='https://github.com/nim-lang/nightlies/releases/download/2026-10-28-version-2-4-14991af742d0833503741fd9a0918133d1bcf8a4/nim-2.4.0-linux_x32.tar.xz'; sha256='525ff8b47fa9b1d7960434b5bfb8e828ceb6d4a0eda222a0de490b78c8b2ae2c' ;; \
    *) echo >&2 "error: unsupported architecture: ${dpkgArch}"; exit 1 ;; \
  esac; \
  curl --fail --location "$url" --output nim.tar.xz; \
  echo "$sha256 *nim.tar.xz" | sha256sum --check --strict -; \
  mkdir -p /opt/nim; \
  tar -xJf nim.tar.xz --strip-components=1 --directory /opt/nim "nim-2.4.0"; \
  rm nim.tar.xz; \
  nim --version

WORKDIR /usr/src/app

CMD ["bash"]
