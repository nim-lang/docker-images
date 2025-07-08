FROM nimlang/nim:0.14.3-ubuntu-slim
LABEL authors="https://github.com/nim-lang/docker-images/graphs/contributors"
RUN apt-get update; apt-get install -y git mercurial libssl-dev
RUN git clone https://github.com/nim-lang/nimble.git;\
    cd nimble; nim -d:release c -r src/nimble -y install;\
    ln -s `pwd`/nimble /bin/nimble
ENV PATH="/root/.nimble/bin:$PATH"
