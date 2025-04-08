FROM nimlang/nim:0.13.0-alpine-slim
LABEL authors="Constantine Molchanov <moigagoo@duck.com>, \
                 Guilherme Thomazi Bonicontro <thomazi@linux.com>, \
                 Dominik Picheta <http://picheta.me>, \
                 nigredo-tori <https://github.com/nigredo-tori>, \
                 markprocess <https://github.com/markprocess>, \
                 theAkito <akito.kitsune@protonmail.com>"
RUN apk add --no-cache git mercurial openssl
RUN git clone https://github.com/nim-lang/nimble.git;\
    cd nimble; nim -d:release c -r src/nimble -y install;\
    ln -s `pwd`/nimble /bin/nimble
ENV PATH="/root/.nimble/bin:$PATH"
