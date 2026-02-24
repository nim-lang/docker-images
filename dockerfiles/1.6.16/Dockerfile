FROM ubuntu:24.04
ENV DEBIAN_FRONTEND=noninteractive

ARG TARGETARCH
ENV NIM_VERSION 1.6.16

ARG URL_AMD64=https://github.com/nim-lang/nightlies/releases/download/2023-10-10-version-1-6-3c9b68dc157804885b14a1984efc25e8b7cc861d/nim-1.6.16-linux_x64.tar.xz
ARG SHA_AMD64=680B2AA5D2E39A0692CCC48583CA8697384C5C053BAC1F2D8D3C6C88640F5DFB

ARG URL_ARM64=https://github.com/nim-lang/nightlies/releases/download/2023-10-10-version-1-6-3c9b68dc157804885b14a1984efc25e8b7cc861d/nim-1.6.16-linux_arm64.tar.xz
ARG SHA_ARM64=182D978AC59BD69399BE88207D42DC023025165799988BA3622C114731636296

ARG URL_ARMV7=https://github.com/nim-lang/nightlies/releases/download/2023-10-10-version-1-6-3c9b68dc157804885b14a1984efc25e8b7cc861d/nim-1.6.16-linux_armv7l.tar.xz
ARG SHA_ARMV7=52B8A15DFBD69EDA0DB7B793F1D6345B1A8A085019B1BA75CB48A5BB70ED4D4A

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
  if [ "$URL" = "none" ]; then echo "Binary not found for $TARGETARCH"; exit 1; fi && \
  curl -L "$URL" -o nim.tar.xz && \
  echo "${CHKSUM}  nim.tar.xz" | sha256sum -c - && \
  tar -xJf nim.tar.xz && \
  mv nim-${NIM_VERSION} /opt/nim && \
  rm nim.tar.xz

ENV PATH="/root/.nimble/bin:/opt/nim/bin:${PATH}"
WORKDIR /usr/src/app
CMD ["nim", "--help"]
