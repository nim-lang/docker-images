FROM ubuntu:24.04
ENV DEBIAN_FRONTEND=noninteractive

ENV NIM_VERSION=2.2.2

ARG URL=https://github.com/nim-lang/nightlies/releases/download/2025-02-14-version-2-2-6c34f62785263ad412f662f3e4e4bf8d8751d113/nim-2.2.2-linux_armv7l.tar.xz
ARG SHA=35447FEB9E1CC3D7C80F1E0F64175E7212092B32DA98D3BB3C9E2195A64B0619

RUN apt-get update && apt-get install -y --no-install-recommends \
  gcc g++ libc6-dev git nodejs ca-certificates openssl curl xz-utils \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /tmp

RUN curl -L "$URL" -o nim.tar.xz && \
  echo "${SHA}  nim.tar.xz" | sha256sum -c - && \
  tar -xJf nim.tar.xz && \
  mv nim-${NIM_VERSION} /opt/nim && \
  rm nim.tar.xz

ENV PATH="/root/.nimble/bin:/opt/nim/bin:${PATH}"
WORKDIR /usr/src/app
CMD ["nim", "--help"]
