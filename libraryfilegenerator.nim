import std/[os, strutils, osproc]

let
  currentCommit = execProcess("git rev-parse HEAD").strip()
  gitRepo = "https://github.com/nim-lang/docker-images.git"

let versions = [
  (version: "2.2.10", tags: @["2.2.10", "2.2", "2", "latest"]),
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
  output.add "Directory: " & dirPath.relativePath(".", sep = '/') & "\n"

  output.add "\n"

writeFile("nim", output)
echo "Generated 'nim' manifest."
