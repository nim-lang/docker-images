FROM nimlang/nim:2.2.0-alpine-slim
LABEL authors="https://github.com/nim-lang/docker-images/graphs/contributors"
RUN apk add --no-cache git mercurial openssl
RUN cd nim; nim c koch; ./koch tools;\
    ln -s `pwd`/bin/nimble /bin/nimble;\
    ln -s `pwd`/bin/nimsuggest /bin/nimsuggest;\
    ln -s `pwd`/bin/testament /bin/testament
ENV PATH="/root/.nimble/bin:$PATH"
