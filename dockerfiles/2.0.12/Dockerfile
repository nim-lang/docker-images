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

ENV NIM_VERSION=2.0.12
ENV PATH="/opt/nim/bin:${PATH}"
ENV PATH="/root/.nimble/bin:${PATH}"

WORKDIR /tmp

RUN set -eux; \
  dpkgArch="$(dpkg --print-architecture)"; \
  case "${dpkgArch}" in \
    amd64) url='https://github.com/nim-lang/nightlies/releases/download/2024-11-01-version-2-0-ce7c6f4f3365db2cc63bdd9d460c71ed937ee9e9/nim-2.0.12-linux_x64.tar.xz'; sha256='b89e0d38f55cd207b0dacb5ee4d6cef4fd1268b63c1490f923d6959839f4548c' ;; \
    arm64) url='https://github.com/nim-lang/nightlies/releases/download/2024-11-01-version-2-0-ce7c6f4f3365db2cc63bdd9d460c71ed937ee9e9/nim-2.0.12-linux_arm64.tar.xz'; sha256='fad4dceef1e208407f94e284dd948fe0732dfe85c999f03dba35c5c64063a0be' ;; \
    i386) url='https://github.com/nim-lang/nightlies/releases/download/2024-11-01-version-2-0-ce7c6f4f3365db2cc63bdd9d460c71ed937ee9e9/nim-2.0.12-linux_x32.tar.xz'; sha256='19fd305089d1d2e63411792f0a2a73e3d19409f5f39e73e88da6d2599c968776' ;; \
    armhf) url='https://github.com/nim-lang/nightlies/releases/download/2024-11-01-version-2-0-ce7c6f4f3365db2cc63bdd9d460c71ed937ee9e9/nim-2.0.12-linux_armv7l.tar.xz'; sha256='3e344ff0294fa2fc3939f415b047cafd56abd844ba57edf9fb2c05473e728486' ;; \
    *) echo >&2 "error: unsupported architecture: ${dpkgArch}"; exit 1 ;; \
  esac; \
  curl --fail --location "$url" --output nim.tar.xz; \
  echo "$sha256 *nim.tar.xz" | sha256sum --check --strict -; \
  mkdir -p /opt/nim; \
  tar -xJf nim.tar.xz --strip-components=1 --directory /opt/nim "nim-2.0.12"; \
  rm nim.tar.xz; \
  nim --version

WORKDIR /usr/src/app

CMD ["bash"]
