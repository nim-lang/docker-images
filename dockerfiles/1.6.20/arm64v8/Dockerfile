FROM ubuntu:24.04
ENV DEBIAN_FRONTEND=noninteractive

ENV NIM_VERSION=1.6.20

ARG URL=https://github.com/nim-lang/nightlies/releases/download/2024-04-07-version-1-6-19fdbfc173bfccb64cb64e0a963e69f52f71fc73/nim-1.6.20-linux_arm64.tar.xz
ARG SHA=98AB46CB8D15206D07559A0A12D06D587F5851509F523B30593422408C13F5AF

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
