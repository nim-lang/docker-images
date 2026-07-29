import std/[os, strutils, osproc, httpclient, json]

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

let releasesUrl = "https://nim-lang.org/releases.json"

let archMap = [
  ("linux_x64",    "amd64"),
  ("linux_arm64",  "arm64v8"),
  ("linux_x32",    "i386"),
  ("linux_armv7l", "arm32v7"),
]

echo "Fetching live releases.json..."
let client = newHttpClient()
var releases: JsonNode
try:
  releases = parseJson(client.getContent(releasesUrl))
except:
  echo "Error: Could not fetch releases.json"
  quit(1)
client.close()

var output = "Maintainers: Constantine Molchanov (@moigagoo)\n"
output.add "GitRepo: " & gitRepo & "\n"
output.add "GitCommit: " & currentCommit & "\n\n"

for (ver, tags) in versions:
  let dirPath = "dockerfiles" / ver

  if not dirExists(dirPath):
    echo "Warning: skipping " & ver & " because " & dirPath & " does not exist."
    continue

  var archs: seq[string]
  if releases.hasKey(ver):
    let versionData = releases[ver]
    for (jsonArch, dockerArch) in archMap:
      if versionData.hasKey(jsonArch):
        archs.add(dockerArch)

  output.add "Tags: " & tags.join(", ") & "\n"
  output.add "Architectures: " & archs.join(", ") & "\n"
  output.add "Directory: " & dirPath.relativePath(".", sep = '/') & "\n"
  output.add "\n"

writeFile("nim", output)
echo "Generated 'nim' manifest."