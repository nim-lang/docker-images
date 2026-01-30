FROM alpine:3.20

ENV NIM_VERSION=1.6.4
ENV PATH="/usr/local/bin:${PATH}"

LABEL authors="https://github.com/nim-lang/docker-images/graphs/contributors"

RUN set -eux; \
    apk add --no-cache \
        ca-certificates \
        g++ \
        libgcc \
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
    ln -s /usr/local/src/nim/bin/nim /usr/local/bin/nim; \
    \
    rm -rf /usr/local/src/nim/c_code /usr/local/src/nim/tests

WORKDIR /app
CMD ["nim", "--version"]
