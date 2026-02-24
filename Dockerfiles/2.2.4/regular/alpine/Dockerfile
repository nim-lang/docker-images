FROM alpine:3.20

ENV NIM_VERSION=2.2.4
ENV PATH="/usr/local/bin:/root/.nimble/bin:${PATH}"

LABEL authors="https://github.com/nim-lang/docker-images/graphs/contributors"

RUN set -eux; \
    apk add --no-cache \
        ca-certificates \
        g++ \
        git \
        libgcc \
        mercurial \
        nodejs \
        openssl-dev \
        wget \
        xz \
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
    rm -rf /usr/local/src/nim/c_code /usr/local/src/nim/tests

WORKDIR /app
CMD ["nim", "--version"]
