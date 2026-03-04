FROM ubuntu:24.04
ENV DEBIAN_FRONTEND=noninteractive

ARG TARGETARCH=arm
ENV NIM_VERSION=1.6.12

ARG URL_AMD64=https://github.com/nim-lang/nightlies/releases/download/2023-03-10-version-1-6-1aa9273640c0c51486cf3a7b67282fe58f360e91/nim-1.6.12-linux_x64.tar.xz
ARG SHA_AMD64=6B22894D0DB974E10BD271217CE7F01A5FCD0B37CB3EA9D539734CB46F2CAC75

ARG URL_ARM64=https://github.com/nim-lang/nightlies/releases/download/2023-03-10-version-1-6-1aa9273640c0c51486cf3a7b67282fe58f360e91/nim-1.6.12-linux_arm64.tar.xz
ARG SHA_ARM64=DC2C8B1379FF07F5ED9DC297FA76BC4424C4E0BFDD7C05117C4A646DDA89AF6F

ARG URL_ARMV7=https://github.com/nim-lang/nightlies/releases/download/2023-03-10-version-1-6-1aa9273640c0c51486cf3a7b67282fe58f360e91/nim-1.6.12-linux_armv7l.tar.xz
ARG SHA_ARMV7=11F6D38DEB3B75D2FD4AA46363FECB54C10119E6A27DEF8B8C4676F06BA0A209

RUN apt-get update && apt-get install -y --no-install-recommends \
  gcc g++ libc6-dev git nodejs ca-certificates openssl curl xz-utils \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /tmp

RUN case "${TARGETARCH}" in \
  "amd64") URL=$URL_AMD64 && CHKSUM=$SHA_AMD64 ;; \
  "arm64") URL=$URL_ARM64 && CHKSUM=$SHA_ARM64 ;; \
  "arm")   URL=$URL_ARMV7 && CHKSUM=$SHA_ARMV7 ;; \
  *) echo "Unsupported arch: ${TARGETARCH}"; exit 1 ;; \
  esac && \
  if [ "$URL" = "none" ] || [ -z "$URL" ]; then \
  echo "Error: Nim binary not available for ${TARGETARCH} in version ${NIM_VERSION}"; \
  exit 1; \
  fi && \
  curl -L "$URL" -o nim.tar.xz && \
  echo "${CHKSUM}  nim.tar.xz" | sha256sum -c - && \
  tar -xJf nim.tar.xz && \
  mv nim-${NIM_VERSION} /opt/nim && \
  rm nim.tar.xz

ENV PATH="/root/.nimble/bin:/opt/nim/bin:${PATH}"
WORKDIR /usr/src/app
CMD ["nim", "--help"]
