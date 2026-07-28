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

ENV NIM_VERSION=2.2.2
ENV PATH="/opt/nim/bin:${PATH}"

WORKDIR /tmp

RUN set -eux; \
  dpkgArch="$(dpkg --print-architecture)"; \
  case "${dpkgArch}" in \
    amd64) url='https://github.com/nim-lang/nightlies/releases/download/2025-02-14-version-2-2-6c34f62785263ad412f662f3e4e4bf8d8751d113/nim-2.2.2-linux_x64.tar.xz'; sha256='2deeec22fcfafb240f7d58e21744f52bafcf9b6e1d5b8add5925e9b8f7cca0b3' ;; \
    arm64) url='https://github.com/nim-lang/nightlies/releases/download/2025-02-14-version-2-2-6c34f62785263ad412f662f3e4e4bf8d8751d113/nim-2.2.2-linux_arm64.tar.xz'; sha256='d983fadd58afd78b0dda5f690b03bf0ba2ee034e3476f4c62cbbe352ffc4656b' ;; \
    i386) url='https://github.com/nim-lang/nightlies/releases/download/2025-02-14-version-2-2-6c34f62785263ad412f662f3e4e4bf8d8751d113/nim-2.2.2-linux_x32.tar.xz'; sha256='ed74edec95eee2cbfa1d0c5a04789beb8ab2ebddcb6f94624c714e5f7424cb1b' ;; \
    armhf) url='https://github.com/nim-lang/nightlies/releases/download/2025-02-14-version-2-2-6c34f62785263ad412f662f3e4e4bf8d8751d113/nim-2.2.2-linux_armv7l.tar.xz'; sha256='35447feb9e1cc3d7c80f1e0f64175e7212092b32da98d3bb3c9e2195a64b0619' ;; \
    *) echo >&2 "error: unsupported architecture: ${dpkgArch}"; exit 1 ;; \
  esac; \
  curl --fail --location "$url" --output nim.tar.xz; \
  echo "$sha256 *nim.tar.xz" | sha256sum --check --strict -; \
  mkdir -p /opt/nim; \
  tar -xJf nim.tar.xz --strip-components=1 --directory /opt/nim "nim-2.2.2"; \
  rm nim.tar.xz; \
  nim --version

WORKDIR /usr/src/app

CMD ["bash"]
