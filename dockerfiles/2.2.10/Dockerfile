FROM debian:trixie-slim

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

ENV NIM_VERSION=2.2.10
ENV PATH="/opt/nim/bin:${PATH}"

WORKDIR /tmp

RUN set -eux; \
  dpkgArch="$(dpkg --print-architecture)"; \
  case "${dpkgArch}" in \
    amd64) url='https://github.com/nim-lang/nightlies/releases/download/2026-04-24-version-2-2-bfeb3146d1638b39f69007a4ae5a23e23ae4e5ef/nim-2.2.10-linux_x64.tar.xz'; sha256='0a3a38752e97e9d44aa479b3a7b37336dfe0176daf22ee5b5218ad0991ecd211' ;; \
    arm64) url='https://github.com/nim-lang/nightlies/releases/download/2026-04-24-version-2-2-bfeb3146d1638b39f69007a4ae5a23e23ae4e5ef/nim-2.2.10-linux_arm64.tar.xz'; sha256='cd86a6e2bcbf029c4870aa51df5c0169345dbf9959889112fd15d403c13ae33a' ;; \
    i386) url='https://github.com/nim-lang/nightlies/releases/download/2026-04-24-version-2-2-bfeb3146d1638b39f69007a4ae5a23e23ae4e5ef/nim-2.2.10-linux_x32.tar.xz'; sha256='7e018e66e570943c8e079e5cf78898444fc627bc0d47b7a5c17dc97cbc12083e' ;; \
    armhf) url='https://github.com/nim-lang/nightlies/releases/download/2026-04-24-version-2-2-bfeb3146d1638b39f69007a4ae5a23e23ae4e5ef/nim-2.2.10-linux_armv7l.tar.xz'; sha256='f8b9ef0adc31b848dc8b57953afd1c8e8223a7f47069caf346363ae73f2b8627' ;; \
    *) echo >&2 "error: unsupported architecture: ${dpkgArch}"; exit 1 ;; \
  esac; \
  curl --fail --location "$url" --output nim.tar.xz; \
  echo "$sha256 *nim.tar.xz" | sha256sum --check --strict -; \
  mkdir -p /opt/nim; \
  tar -xJf nim.tar.xz --strip-components=1 --directory /opt/nim "nim-2.2.10"; \
  rm nim.tar.xz; \
  nim --version

WORKDIR /usr/src/app

CMD ["bash"]
