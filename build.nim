import os, parseopt, strutils, json
import flavors / [slim, regular, onbuild]

proc isDefault(props: JsonNode): bool = props.getOrDefault("default").getBool

proc isLatest(props: JsonNode): bool = props.getOrDefault("latest").getBool

proc getTags(version, base: tuple[key: string, val: JsonNode],
             flavor: string): seq[string] =
  result = @[]

  result.add([version.key, base.key, flavor].join("-"))

  if flavor == "regular":
    result.add([version.key, base.key].join("-"))

    if version.val.isLatest:
      result.add(["latest", base.key].join("-"))

    if base.val.isDefault:
      result.add version.key

  if version.val.isLatest:
    result.add(["latest", base.key, flavor].join("-"))

    if flavor == "regular":
      result.add base.key

  if base.val.isDefault:
    result.add([version.key, flavor].join("-"))

  if version.val.isLatest and base.val.isDefault:
    if flavor == "regular":
      result.add "latest"

    result.add(["latest", flavor].join("-"))
    result.add flavor

proc generateDockerfile(version, base, flavor: string,
                        labels: openarray[(string, string)]) =

  var content = ""

  case flavor
  of "slim":
    case base
    of "ubuntu":
      content = slim.ubuntu(version, labels)
    of "alpine":
      content = slim.alpine(version, labels)
    else: discard
  of "regular":
    case base
    of "ubuntu":
      content = regular.ubuntu(version, labels)
    of "alpine":
      content = regular.alpine(version, labels)
    else: discard
  of "onbuild":
    content = onbuild.any(version, base, labels)
  else: discard

  writeFile("Dockerfile", content)

proc buildImage(tags: openarray[string], tagPrefix: string) =
  const dockerBuildCommand = "docker build $# ."

  var tagLine = ""

  for tag in tags:
    tagLine &= " -t $#:$# " % [tagPrefix, tag]

  discard execShellCmd dockerBuildCommand % tagLine

proc pushImage(tags: openarray[string], tagPrefix: string) =
  const dockerPushCommand = "docker push $#"

  for tag in tags:
    let tagLine = "$#:$#" % [tagPrefix, tag]
    discard execShellCmd dockerPushCommand % tagLine

proc testImage(image: string, flavor: string) =
  let succeeded = case flavor
  of "slim":
    let cmd = "docker run --rm $# nim --version" % image
    execShellCmd(cmd) == 0
  of "regular", "onbuild":
    # Check that nimble at least launches
    let cmd = "docker run --rm $# nimble --version" % image
    execShellCmd(cmd) == 0
  else: true

  if not succeeded:
    echo "Failed the image test"
    quit QuitFailure

when isMainModule:
  const
    authors = """Konstantin Molchanov <moigagoo@live.com>, \
                 Guilherme Thomazi Bonicontro <thomazi@linux.com>, \
                 Dominik Picheta <http://picheta.me>, \
                 nigredo-tori <https://github.com/nigredo-tori>, \
                 markprocess <https://github.com/markprocess>"""
    labels = {"authors": authors}
    tagPrefix = "nimlang/nim"
    flavors = ["slim", "regular", "onbuild"]

  let
    config = parseFile("config.json")
    bases = config["bases"]
    versions = config["versions"]

  var targets: seq[string] = @[]

  for kind, key, val in getopt():
    case kind
    of cmdArgument: targets.add key
    else: discard

  for version in versions.pairs:
    if len(targets) == 0 or version.key in targets:
      for base in bases.pairs:
        for flavor in flavors:
          let tags = getTags(version, base, flavor)

          echo "Building $#... " % tags[0]
          generateDockerfile(version.key, base.key, flavor, labels)
          buildImage(tags, tagPrefix)
          removeFile("Dockerfile")
          echo "Done!"

          # Anything before this is broken and too old to fix.
          if version.key >= "0.16.0":
            echo "Testing $#... " % tags[0]
            testImage(
              "$#:$#" % [tagPrefix, tags[0]],
              flavor
            )
            echo "Done!"


          echo "Pushing $#..." % tags[0]
          pushImage(tags, tagPrefix)
          echo "Done!"

