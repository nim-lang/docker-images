FROM ubuntu:24.04
ENV DEBIAN_FRONTEND=noninteractive

ARG TARGETARCH=arm64
ENV NIM_VERSION=1.6.20

ARG URL_AMD64=https://github.com/nim-lang/nightlies/releases/download/2024-04-07-version-1-6-19fdbfc173bfccb64cb64e0a963e69f52f71fc73/nim-1.6.20-linux_x64.tar.xz
ARG SHA_AMD64=73D4672DBECF76D2E8E4CD58F0711EBC131F17BE8F3B7FE37E768F9D26C1DCD7

ARG URL_ARM64=https://github.com/nim-lang/nightlies/releases/download/2024-04-07-version-1-6-19fdbfc173bfccb64cb64e0a963e69f52f71fc73/nim-1.6.20-linux_arm64.tar.xz
ARG SHA_ARM64=98AB46CB8D15206D07559A0A12D06D587F5851509F523B30593422408C13F5AF

ARG URL_ARMV7=https://github.com/nim-lang/nightlies/releases/download/2024-04-07-version-1-6-19fdbfc173bfccb64cb64e0a963e69f52f71fc73/nim-1.6.20-linux_armv7l.tar.xz
ARG SHA_ARMV7=83333EF01F8276F4F1D331E08498FC6EF30C4636FF95C5131C82503A6BFB55BD

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
