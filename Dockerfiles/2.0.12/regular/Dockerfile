FROM nimlang/nim:2.0.12-alpine-slim
LABEL authors="Constantine Molchanov <moigagoo@duck.com>, \
                 Guilherme Thomazi Bonicontro <thomazi@linux.com>, \
                 Dominik Picheta <http://picheta.me>, \
                 nigredo-tori <https://github.com/nigredo-tori>, \
                 markprocess <https://github.com/markprocess>, \
                 theAkito <akito.kitsune@protonmail.com>"
RUN apk add --no-cache git mercurial openssl
RUN cd nim; nim c koch; ./koch tools;\
    ln -s `pwd`/bin/nimble /bin/nimble;\
    ln -s `pwd`/bin/nimsuggest /bin/nimsuggest;\
    ln -s `pwd`/bin/testament /bin/testament
ENV PATH="/root/.nimble/bin:$PATH"
