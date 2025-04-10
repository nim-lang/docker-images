FROM alpine:3.20
LABEL authors="Constantine Molchanov <moigagoo@duck.com>, \
                 Guilherme Thomazi Bonicontro <thomazi@linux.com>, \
                 Dominik Picheta <http://picheta.me>, \
                 nigredo-tori <https://github.com/nigredo-tori>, \
                 markprocess <https://github.com/markprocess>, \
                 theAkito <akito.kitsune@protonmail.com>"
RUN apk add --no-cache g++ curl tar xz nodejs
RUN mkdir -p /nim; \
    curl -sL "https://nim-lang.org/download/nim-1.6.0.tar.xz" \
    |tar xJ --strip-components=1 -C /nim; \
    cd /nim; sh build.sh; \
    rm -r c_code tests; \
    ln -s `pwd`/bin/nim /bin/nim
