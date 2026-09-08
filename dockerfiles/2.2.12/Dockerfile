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

ENV NIM_VERSION=2.2.12
ENV PATH="/opt/nim/bin:${PATH}"
ENV PATH="/root/.nimble/bin:${PATH}"

WORKDIR /tmp

RUN set -eux; \
  dpkgArch="$(dpkg --print-architecture)"; \
  case "${dpkgArch}" in \
    amd64) url='https://github.com/nim-lang/nightlies/releases/download/2026-09-08-version-2-2-8e8fbf60693418dc95bb0d762fd660231d08a583/nim-2.2.12-linux_x64.tar.xz'; sha256='7df1611449a6842af69322aa2c1206942982650a5f6bc0d37bc8ec109932f638' ;; \
    arm64) url='https://github.com/nim-lang/nightlies/releases/download/2026-09-08-version-2-2-8e8fbf60693418dc95bb0d762fd660231d08a583/nim-2.2.12-linux_arm64.tar.xz'; sha256='3dc04191af72a8310cf1c8ffb6f772cc3716fc5f264bc7c453ab4aecb4085221' ;; \
    i386) url='https://github.com/nim-lang/nightlies/releases/download/2026-09-08-version-2-2-8e8fbf60693418dc95bb0d762fd660231d08a583/nim-2.2.12-linux_x32.tar.xz'; sha256='fabe576a48db63d20d6077b3ee921b2806fcfa108b7aaddf8f230d09f4b54e5d' ;; \
    armhf) url='https://github.com/nim-lang/nightlies/releases/download/2026-09-08-version-2-2-8e8fbf60693418dc95bb0d762fd660231d08a583/nim-2.2.12-linux_armv7l.tar.xz'; sha256='c4893f5c4b51064ae9a686a4aeb168d0ba1da97f4cbc7032b6c684e51d63e881' ;; \
    *) echo >&2 "error: unsupported architecture: ${dpkgArch}"; exit 1 ;; \
  esac; \
  curl --fail --location "$url" --output nim.tar.xz; \
  echo "$sha256 *nim.tar.xz" | sha256sum --check --strict -; \
  mkdir -p /opt/nim; \
  tar -xJf nim.tar.xz --strip-components=1 --directory /opt/nim "nim-2.2.12"; \
  rm nim.tar.xz; \
  nim --version

WORKDIR /usr/src/app

CMD ["bash"]
