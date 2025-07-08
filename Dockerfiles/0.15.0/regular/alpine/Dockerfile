FROM nimlang/nim:0.15.0-alpine-slim
LABEL authors="https://github.com/nim-lang/docker-images/graphs/contributors"
RUN apk add --no-cache git mercurial openssl
RUN git clone https://github.com/nim-lang/nimble.git;\
    cd nimble; nim -d:release c -r src/nimble -y install;\
    ln -s `pwd`/nimble /bin/nimble
ENV PATH="/root/.nimble/bin:$PATH"
