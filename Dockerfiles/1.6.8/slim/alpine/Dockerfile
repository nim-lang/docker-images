FROM alpine:3.20
LABEL authors="https://github.com/nim-lang/docker-images/graphs/contributors"
RUN apk add --no-cache g++ curl tar xz nodejs
RUN mkdir -p /nim; \
    curl -sL "https://nim-lang.org/download/nim-1.6.8.tar.xz" \
    |tar xJ --strip-components=1 -C /nim; \
    cd /nim; sh build.sh; \
    rm -r c_code tests; \
    ln -s `pwd`/bin/nim /bin/nim
