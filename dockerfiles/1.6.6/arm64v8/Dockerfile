FROM ubuntu:24.04
ENV DEBIAN_FRONTEND=noninteractive

ARG TARGETARCH=arm64
ENV NIM_VERSION=1.6.6

ARG URL_AMD64=https://github.com/nim-lang/nightlies/releases/download/2022-05-05-version-1-6-0565a70eab02122ce278b98181c7d1170870865c/nim-1.6.6-linux_x64.tar.xz
ARG SHA_AMD64=3E88DF45DBBEC2F083D31E00E6F2C07E0C70C392C91B2A934F7F283DD0FDF5F9

ARG URL_ARM64=https://github.com/nim-lang/nightlies/releases/download/2022-05-05-version-1-6-0565a70eab02122ce278b98181c7d1170870865c/nim-1.6.6-linux_arm64.tar.xz
ARG SHA_ARM64=862AD44F3650C63901877249D7A0E630E05A0E4DA91076AC4FB690F2AFA11F69

ARG URL_ARMV7=https://github.com/nim-lang/nightlies/releases/download/2022-05-05-version-1-6-0565a70eab02122ce278b98181c7d1170870865c/nim-1.6.6-linux_armv7l.tar.xz
ARG SHA_ARMV7=A60E9198C59FB6A45AEE114CB8E9B1F566ED06A5B4364A67C240A2D669310C89

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
