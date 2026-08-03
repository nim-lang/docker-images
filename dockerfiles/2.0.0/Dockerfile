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

ENV NIM_VERSION=2.0.0
ENV PATH="/opt/nim/bin:${PATH}"
ENV PATH="/root/.nimble/bin:${PATH}"

WORKDIR /tmp

RUN set -eux; \
  dpkgArch="$(dpkg --print-architecture)"; \
  case "${dpkgArch}" in \
    amd64) url='https://github.com/nim-lang/nightlies/releases/download/2023-08-01-version-2-0-a488067a4130f029000be4550a0fb1b39e0e9e7c/nim-2.0.0-linux_x64.tar.xz'; sha256='ca1ffec35439a02b3102faf1c1caf5a033f929832b7fa2c76b3a6a7216f14f01' ;; \
    arm64) url='https://github.com/nim-lang/nightlies/releases/download/2023-08-01-version-2-0-a488067a4130f029000be4550a0fb1b39e0e9e7c/nim-2.0.0-linux_arm64.tar.xz'; sha256='96c2b96c68ca598720b4e6048e4d89b88f47612e7f7887f7b6da734270eb00e2' ;; \
    i386) url='https://github.com/nim-lang/nightlies/releases/download/2023-08-01-version-2-0-a488067a4130f029000be4550a0fb1b39e0e9e7c/nim-2.0.0-linux_x32.tar.xz'; sha256='0221d595597abc9068885b5833db69a137bdf3c59b073ff1f4c290b22f8ecff3' ;; \
    armhf) url='https://github.com/nim-lang/nightlies/releases/download/2023-08-01-version-2-0-a488067a4130f029000be4550a0fb1b39e0e9e7c/nim-2.0.0-linux_armv7l.tar.xz'; sha256='812b6264e4b33fff7356e648438dc4bcfb0a78a945f7f1a0b8314427afc20fe0' ;; \
    *) echo >&2 "error: unsupported architecture: ${dpkgArch}"; exit 1 ;; \
  esac; \
  curl --fail --location "$url" --output nim.tar.xz; \
  echo "$sha256 *nim.tar.xz" | sha256sum --check --strict -; \
  mkdir -p /opt/nim; \
  tar -xJf nim.tar.xz --strip-components=1 --directory /opt/nim "nim-2.0.0"; \
  rm nim.tar.xz; \
  nim --version

WORKDIR /usr/src/app

CMD ["bash"]
