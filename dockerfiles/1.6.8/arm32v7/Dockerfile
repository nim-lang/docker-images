FROM ubuntu:24.04
ENV DEBIAN_FRONTEND=noninteractive

ARG TARGETARCH=arm
ENV NIM_VERSION=1.6.8

ARG URL_AMD64=https://github.com/nim-lang/nightlies/releases/download/2022-09-27-version-1-6-c9f46ca8c9eeca8b5f68591b1abe14b962f80a4c/nim-1.6.8-linux_x64.tar.xz
ARG SHA_AMD64=2263C5F451FBC5D00E07B817F86D05AE768349822496D1259AD5383E1691DE9B

ARG URL_ARM64=https://github.com/nim-lang/nightlies/releases/download/2022-09-27-version-1-6-c9f46ca8c9eeca8b5f68591b1abe14b962f80a4c/nim-1.6.8-linux_arm64.tar.xz
ARG SHA_ARM64=C88EAC4BD8B87958696A8113600DD1E3497CA4642F014F667ABF37626925997F

ARG URL_ARMV7=https://github.com/nim-lang/nightlies/releases/download/2022-09-27-version-1-6-c9f46ca8c9eeca8b5f68591b1abe14b962f80a4c/nim-1.6.8-linux_armv7l.tar.xz
ARG SHA_ARMV7=A853E9F6BC163FC3AFE9C027C81B6C4DF3475430654762AAC918C08A1C558293

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
