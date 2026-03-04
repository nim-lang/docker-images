FROM ubuntu:24.04
ENV DEBIAN_FRONTEND=noninteractive

ARG TARGETARCH=arm64
ENV NIM_VERSION=1.6.14

ARG URL_AMD64=https://github.com/nim-lang/nightlies/releases/download/2023-06-27-version-1-6-71ba2e7f3c5815d956b1ae0341b0743242b8fec6/nim-1.6.14-linux_x64.tar.xz
ARG SHA_AMD64=1E7073C05600F2BE5F2D9018E73F4584F0369442455AB27521CA499B47EEF904

ARG URL_ARM64=https://github.com/nim-lang/nightlies/releases/download/2023-06-27-version-1-6-71ba2e7f3c5815d956b1ae0341b0743242b8fec6/nim-1.6.14-linux_arm64.tar.xz
ARG SHA_ARM64=4A8D63A0499CEC0F4E0F655A99950BB211B9FA0213CF8A5D5996E9876430CE07

ARG URL_ARMV7=https://github.com/nim-lang/nightlies/releases/download/2023-06-27-version-1-6-71ba2e7f3c5815d956b1ae0341b0743242b8fec6/nim-1.6.14-linux_armv7l.tar.xz
ARG SHA_ARMV7=E8200BCDFA72E9B934F67CF33CD0ECD4AD603F55CC78656ED4E02EE5FA44D7B3

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
