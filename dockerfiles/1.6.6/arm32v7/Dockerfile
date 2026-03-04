FROM ubuntu:24.04
ENV DEBIAN_FRONTEND=noninteractive

ENV NIM_VERSION=1.6.6

ARG URL=https://github.com/nim-lang/nightlies/releases/download/2022-05-05-version-1-6-0565a70eab02122ce278b98181c7d1170870865c/nim-1.6.6-linux_armv7l.tar.xz
ARG SHA=A60E9198C59FB6A45AEE114CB8E9B1F566ED06A5B4364A67C240A2D669310C89

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
