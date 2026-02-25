import std/[os, strutils, osproc]

let
  currentCommit = execProcess("git rev-parse HEAD").strip()
  gitRepo = "https://github.com/nim-lang/docker-images.git"

let versions = [
  (version: "2.2.8", tags: @["2.2.8", "2.2", "2", "latest"]),
  (version: "2.2.6", tags: @["2.2.6"]),
  (version: "2.2.4", tags: @["2.2.4"]),
  (version: "2.2.2", tags: @["2.2.2"]),
  (version: "2.2.0", tags: @["2.2.0"]),
  (version: "2.0.14", tags: @["2.0.14", "2.0"]),
  (version: "2.0.12", tags: @["2.0.12"]),
  (version: "2.0.10", tags: @["2.0.10"]),
  (version: "2.0.8", tags: @["2.0.8"]),
  (version: "2.0.6", tags: @["2.0.6"]),
  (version: "2.0.4", tags: @["2.0.4"]),
  (version: "2.0.2", tags: @["2.0.2"]),
  (version: "2.0.0", tags: @["2.0.0"]),
  (version: "1.6.18", tags: @["1.6.18", "1.6", "1"]),
  (version: "1.6.16", tags: @["1.6.16"]),
  (version: "1.6.14", tags: @["1.6.14"]),
  (version: "1.6.12", tags: @["1.6.12"]),
  (version: "1.6.10", tags: @["1.6.10"]),
  (version: "1.6.8", tags: @["1.6.8"]),
  (version: "1.6.6", tags: @["1.6.6"]),
  (version: "1.6.4", tags: @["1.6.4"]),
  (version: "1.6.2", tags: @["1.6.2"]),
  (version: "1.6.0", tags: @["1.6.0"]),
]

var output = "Maintainers: Constantine Molchanov (@moigagoo)\n"
output.add "GitRepo: " & gitRepo & "\n\n"

for v in versions:
  let dirPath = "dockerfiles" / v.version
  let dockerfilePath = dirPath / "Dockerfile"

  if not fileExists(dockerfilePath):
    echo "Warning: skipping " & v.version & " because " & dockerfilePath &
      " was not found."
    continue

  let content = readFile(dockerfilePath)
  var supportedArchs: seq[string]

  if "URL_AMD64=none" notin content:
    supportedArchs.add "amd64"
  if "URL_ARM64=none" notin content:
    supportedArchs.add "arm64v8"
  if "URL_ARMV7=none" notin content:
    supportedArchs.add "arm32v7"

  output.add "Tags: " & v.tags.join(", ") & "\n"
  output.add "GitCommit: " & currentCommit & "\n"
  output.add "Directory: " & dirPath.relativePath(".", sep = '/') & "\n"
  output.add "Architectures: " & supportedArchs.join(", ") & "\n\n"

writeFile("nim", output)
echo "Generated 'nim' manifest."
echo "Review the output to ensure architectures are correctly filtered for each version."
