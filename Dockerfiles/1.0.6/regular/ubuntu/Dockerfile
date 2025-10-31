FROM nimlang/nim:1.0.6-ubuntu-slim
LABEL authors="https://github.com/nim-lang/docker-images/graphs/contributors"
RUN apt-get update; apt-get install -y git mercurial libssl-dev
RUN cd nim; nim c koch; ./koch tools;\
    ln -s `pwd`/bin/nimble /bin/nimble;\
    ln -s `pwd`/bin/nimsuggest /bin/nimsuggest;\
    ln -s `pwd`/bin/testament /bin/testament
ENV PATH="/root/.nimble/bin:$PATH"
