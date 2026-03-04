FROM ubuntu:24.04
ENV DEBIAN_FRONTEND=noninteractive

ENV NIM_VERSION=1.6.14

ARG URL=https://github.com/nim-lang/nightlies/releases/download/2023-06-27-version-1-6-71ba2e7f3c5815d956b1ae0341b0743242b8fec6/nim-1.6.14-linux_armv7l.tar.xz
ARG SHA=E8200BCDFA72E9B934F67CF33CD0ECD4AD603F55CC78656ED4E02EE5FA44D7B3

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
