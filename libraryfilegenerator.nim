import std/[os, strutils, osproc]

let
  currentCommit = execProcess("git rev-parse HEAD").strip()
  gitRepo = "https://github.com/nim-lang/docker-images.git"

let versions = [
  (version: "2.2.10", tags: @["2.2.10", "2.2", "2", "latest"]),
  (version: "2.2.8",  tags: @["2.2.8"]),
  (version: "2.2.6",  tags: @["2.2.6"]),
  (version: "2.2.4",  tags: @["2.2.4"]),
  (version: "2.2.2",  tags: @["2.2.2"]),
  (version: "2.2.0",  tags: @["2.2.0"]),
  (version: "2.0.14", tags: @["2.0.14", "2.0"]),
  (version: "2.0.12", tags: @["2.0.12"]),
  (version: "2.0.10", tags: @["2.0.10"]),
  (version: "2.0.8",  tags: @["2.0.8"]),
  (version: "2.0.6",  tags: @["2.0.6"]),
  (version: "2.0.4",  tags: @["2.0.4"]),
  (version: "2.0.2",  tags: @["2.0.2"]),
  (version: "2.0.0",  tags: @["2.0.0"]),
]

var output = "Maintainers: Constantine Molchanov (@moigagoo)\n"
output.add "GitRepo: " & gitRepo & "\n"
output.add "GitCommit: " & currentCommit & "\n\n"

for v in versions:
  let dirPath = "dockerfiles" / v.version

  if not dirExists(dirPath):
    echo "Warning: skipping " & v.version & " because " & dirPath & " does not exist."
    continue

  output.add "Tags: " & v.tags.join(", ") & "\n"
  output.add "Architectures: amd64, arm64v8, i386, arm32v7\n"
  output.add "Directory: " & dirPath.relativePath(".", sep = '/') & "\n"

  output.add "\n"

writeFile("nim", output)
echo "Generated 'nim' manifest."
