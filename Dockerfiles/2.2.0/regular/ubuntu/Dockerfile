FROM ubuntu:noble

ENV NIM_VERSION=2.2.0
ENV PATH="/usr/local/bin:/root/.nimble/bin:${PATH}"

LABEL authors="https://github.com/nim-lang/docker-images/graphs/contributors"

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        g++ \
        git \
        libssl-dev \
        mercurial \
        nodejs \
        wget \
        xz-utils \
    ; \
    \
    wget -O nim.tar.xz "https://nim-lang.org/download/nim-2.2.6.tar.xz"; \
    mkdir -p /usr/local/src/nim; \
    tar -xf nim.tar.xz -C /usr/local/src/nim --strip-components=1; \
    rm nim.tar.xz; \
    \
    cd /usr/local/src/nim; \
    sh build.sh; \
    \
    bin/nim c koch; \
    ./koch tools; \
    \
    ln -s /usr/local/src/nim/bin/nim /usr/local/bin/nim; \
    ln -s /usr/local/src/nim/bin/nimble /usr/local/bin/nimble; \
    ln -s /usr/local/src/nim/bin/nimsuggest /usr/local/bin/nimsuggest; \
    ln -s /usr/local/src/nim/bin/testament /usr/local/bin/testament; \
    \
    rm -rf /usr/local/src/nim/c_code /usr/local/src/nim/tests; \
    apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false; \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
CMD ["nim", "--version"]
