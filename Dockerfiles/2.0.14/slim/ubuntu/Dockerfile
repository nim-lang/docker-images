FROM ubuntu:focal
LABEL authors="https://github.com/nim-lang/docker-images/graphs/contributors"
RUN apt-get update; apt-get install -y wget xz-utils g++; \
    wget -qO- https://deb.nodesource.com/setup_13.x | bash -; \
    apt-get install -y nodejs
RUN wget https://nim-lang.org/download/nim-2.0.14.tar.xz; \
    tar xf nim-2.0.14.tar.xz; rm nim-2.0.14.tar.xz; \
    mv nim-2.0.14 nim; \
    cd nim; sh build.sh; \
    rm -r c_code tests; \
    ln -s `pwd`/bin/nim /bin/nim
