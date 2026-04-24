import std/[os, strutils, osproc]

let
  currentCommit = execProcess("git rev-parse HEAD").strip()
  gitRepo = "https://github.com/nim-lang/docker-images.git"

let versions = [
  (version: "2.2.10", tags: @["2.2.10", "2.2", "2", "latest"]),
  (version: "2.2.8", tags: @["2.2.8"]),
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
  (version: "1.6.20", tags: @["1.6.20", "1.6", "1"]),
  (version: "1.6.18", tags: @["1.6.18"]),
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
  var supportedArchs: seq[string]

  if dirExists(dirPath / "amd64"):
    supportedArchs.add "amd64"
  if dirExists(dirPath / "arm64v8"):
    supportedArchs.add "arm64v8"
  if dirExists(dirPath / "arm32v7"):
    supportedArchs.add "arm32v7"

  if supportedArchs.len == 0:
    echo "Warning: skipping " & v.version &
      " because no architecture subdirectories were found."
    continue

  output.add "Tags: " & v.tags.join(", ") & "\n"
  output.add "GitCommit: " & currentCommit & "\n"
  output.add "Architectures: " & supportedArchs.join(", ") & "\n"

  # Map directories for each architecture
  for arch in supportedArchs:
    let archDir = (dirPath / arch).relativePath(".", sep = '/')
    if arch == "amd64":
      output.add "Directory: " & archDir & "\n"
    else:
      output.add arch & "-Directory: " & archDir & "\n"

  output.add "\n"

writeFile("nim", output)
echo "Generated 'nim' manifest."
