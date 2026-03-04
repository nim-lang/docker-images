FROM ubuntu:24.04
ENV DEBIAN_FRONTEND=noninteractive

ARG TARGETARCH=arm
ENV NIM_VERSION=1.6.2

ARG URL_AMD64=https://github.com/nim-lang/nightlies/releases/download/2021-12-17-version-1-6-9084d9bc02bcd983b81a4c76a05f27b9ce2707dd/nim-1.6.2-linux_x64.tar.xz
ARG SHA_AMD64=9E0C616FE504402E29E43D44708A49416DCBFA295CEE1883CE6E5BFB25C364F1

ARG URL_ARM64=https://github.com/nim-lang/nightlies/releases/download/2021-12-17-version-1-6-9084d9bc02bcd983b81a4c76a05f27b9ce2707dd/nim-1.6.2-linux_arm64.tar.xz
ARG SHA_ARM64=89E772E3E7773D2A21FB7C2498110BAE09E3C6167591AED502C8D34FA7CFBBC4

ARG URL_ARMV7=https://github.com/nim-lang/nightlies/releases/download/2021-12-17-version-1-6-9084d9bc02bcd983b81a4c76a05f27b9ce2707dd/nim-1.6.2-linux_armv7l.tar.xz
ARG SHA_ARMV7=A727D3882B6D28FFEE24BABB1EBE15C3262A0758D1CDAA15452C244DE106BB5C

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
