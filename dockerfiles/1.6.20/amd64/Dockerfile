FROM node:lts-trixie

ENV NIM_VERSION=1.6.20
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
    amd64) url='https://github.com/nim-lang/nightlies/releases/download/2024-04-07-version-1-6-19fdbfc173bfccb64cb64e0a963e69f52f71fc73/nim-1.6.20-linux_x64.tar.xz'; sha256='73D4672DBECF76D2E8E4CD58F0711EBC131F17BE8F3B7FE37E768F9D26C1DCD7' ;; \
    arm64) url='https://github.com/nim-lang/nightlies/releases/download/2024-04-07-version-1-6-19fdbfc173bfccb64cb64e0a963e69f52f71fc73/nim-1.6.20-linux_arm64.tar.xz'; sha256='98AB46CB8D15206D07559A0A12D06D587F5851509F523B30593422408C13F5AF' ;; \
    armhf) url='https://github.com/nim-lang/nightlies/releases/download/2024-04-07-version-1-6-19fdbfc173bfccb64cb64e0a963e69f52f71fc73/nim-1.6.20-linux_armv7l.tar.xz'; sha256='83333EF01F8276F4F1D331E08498FC6EF30C4636FF95C5131C82503A6BFB55BD' ;; \
    *) echo >&2 "error: unsupported architecture: ${dpkgArch}"; exit 1 ;; \
  esac; \
  curl --fail --location "$url" --output nim.tar.xz; \
  echo "$sha256 *nim.tar.xz" | sha256sum --check --strict -; \
  mkdir -p /opt/nim; \
  tar -xJf nim.tar.xz --strip-components=1 --directory /opt/nim "nim-${NIM_VERSION}"; \
  rm nim.tar.xz; \
  nim --version

WORKDIR /usr/src/app
