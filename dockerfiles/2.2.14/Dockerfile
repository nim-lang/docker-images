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

ENV NIM_VERSION=2.2.14
ENV PATH="/opt/nim/bin:${PATH}"
ENV PATH="/root/.nimble/bin:${PATH}"

WORKDIR /tmp

RUN set -eux; \
  dpkgArch="$(dpkg --print-architecture)"; \
  case "${dpkgArch}" in \
    amd64) url='https://github.com/nim-lang/nightlies/releases/download/2026-10-28-version-2-2-c5c2337564e347bb8252a510c79a74817a670231/nim-2.2.14-linux_x64.tar.xz'; sha256='c1cbd106f9ff0c856e38abebd0ac9503c23aa3393174fcfc3307ee3b2bfe909a' ;; \
    arm64) url='https://github.com/nim-lang/nightlies/releases/download/2026-10-28-version-2-2-c5c2337564e347bb8252a510c79a74817a670231/nim-2.2.14-linux_arm64.tar.xz'; sha256='74c03927d88f935a9acf18576d599eceb3d6f6bd1f7a4d267675c4b6007b901f' ;; \
    i386) url='https://github.com/nim-lang/nightlies/releases/download/2026-10-28-version-2-2-c5c2337564e347bb8252a510c79a74817a670231/nim-2.2.14-linux_x32.tar.xz'; sha256='0d91cd7e71db216ef880c309450f2878e5ac10478b014ab63e00f063e93dcc57' ;; \
    armhf) url='https://github.com/nim-lang/nightlies/releases/download/2026-10-28-version-2-2-c5c2337564e347bb8252a510c79a74817a670231/nim-2.2.14-linux_armv7l.tar.xz'; sha256='3852e6b15e0182a3643987b59efe1bb4cf7206ab7a247b9670654304492bd7c2' ;; \
    *) echo >&2 "error: unsupported architecture: ${dpkgArch}"; exit 1 ;; \
  esac; \
  curl --fail --location "$url" --output nim.tar.xz; \
  echo "$sha256 *nim.tar.xz" | sha256sum --check --strict -; \
  mkdir -p /opt/nim; \
  tar -xJf nim.tar.xz --strip-components=1 --directory /opt/nim "nim-2.2.14"; \
  rm nim.tar.xz; \
  nim --version

WORKDIR /usr/src/app

CMD ["bash"]
