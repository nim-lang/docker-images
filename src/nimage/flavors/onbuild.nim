#? stdtmpl
#proc any*(version, base: string,
#          labels: openarray[(string, string)] = {:}): string =
#  result = ""
FROM nimlang/nim:$version-$base-regular
#  for label, value in labels.items:
LABEL $label="$value"
#  end for
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ONBUILD COPY . /usr/src/app
ONBUILD RUN nimble build -y
#end proc
