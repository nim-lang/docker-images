ARG NIM_VERSION

FROM --platform=$BUILDPLATFORM ubuntu:24.04 AS builder
ARG NIM_VERSION
ARG TARGETARCH

RUN apt-get update && apt-get install -y curl xz-utils && rm -rf /var/lib/apt/lists/*

WORKDIR /tmp

RUN case "${TARGETARCH}" in \
  "amd64")  NIM_ARCH="linux_x64" ;; \
  "arm64")  NIM_ARCH="linux_arm64" ;; \
  "arm")    NIM_ARCH="linux_armv7" ;; \
  *) echo "Unsupported architecture: ${TARGETARCH}"; exit 1 ;; \
  esac && \
  curl -L "https://nim-lang.org/download/nim-${NIM_VERSION}-${NIM_ARCH}.tar.xz" -o nim.tar.xz && \
  tar -xJf nim.tar.xz && \
  mv nim-${NIM_VERSION} /opt/nim

FROM ubuntu:24.04
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
  gcc \
  g++ \
  libc6-dev \
  nodejs \
  ca-certificates \
  openssl \
  git \
  && rm -rf /var/lib/apt/lists/*

COPY --from=builder /opt/nim /opt/nim

ENV PATH="/root/.nimble/bin:/opt/nim/bin:${PATH}"

WORKDIR /usr/src/app

RUN nim --version && nimble --version && gcc --version && node --version

CMD ["nim", "--help"]
