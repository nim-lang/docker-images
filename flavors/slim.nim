#? stdtmpl
#proc ubuntu*(version: string,
#             labels: openarray[(string, string)] = {:}): string =
#  result = ""
FROM nimlang/nim:$version-ubuntu-slim
#  for label, value in labels.items:
LABEL $label="$value"
#  end for
RUN apt-get update; apt-get install -y git
#  if version >= "0.16.0":
RUN cd nim; nim c koch; ./koch tools; \
    ln -s `pwd`/bin/nimble /bin/nimble; \
    ln -s `pwd`/bin/nimsuggest /bin/nimsuggest
#  else:
RUN git clone https://github.com/nim-lang/nimble.git;\
    cd nimble; nim -d:release c -r src/nimble -y install;\
    ln -s `pwd`/nimble /bin/nimble
#  end if
#end proc
#
#proc alpine*(version: string,
#             labels: openarray[(string, string)] = {:}): string =
#  result = ""
FROM nimlang/nim:$version-alpine-slim
#  for label, value in labels.items:
LABEL $label="$value"
#  end for
RUN apk add --no-cache git
#  if version >= "0.16.0":
RUN cd nim; nim c koch; ./koch tools; \
    ln -s `pwd`/bin/nimble /bin/nimble; \
    ln -s `pwd`/bin/nimsuggest /bin/nimsuggest
#  else:
RUN git clone https://github.com/nim-lang/nimble.git;\
    cd nimble; nim -d:release c -r src/nimble -y install;\
    ln -s `pwd`/nimble /bin/nimble
#  end if
#end proc
