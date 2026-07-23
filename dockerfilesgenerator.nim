import std/[os, strutils, httpclient, json, tables]
import nimcrypto # Requires: nimble install nimcrypto

# Configuration
const
  targetVersions = [
    "2.2.10", "2.2.8", "2.2.6", "2.2.4", "2.2.2", "2.2.0", "2.0.14", "2.0.12", "2.0.10",
    "2.0.8", "2.0.6", "2.0.4", "2.0.2", "2.0.0",
  ]
  releasesUrl = "https://nim-lang.org/releases.json"
  templatePath = "Dockerfile.template"

proc getLocalSha256(url: string): string =
  ## Downloads binary to temp and hashes it using nimcrypto's streaming API.
  ## Retries up to 3 times on failure.
  let tempFile = getTempDir() / "nim_binary_tmp.tar.xz"

  var lastError = ""
  for attempt in 1..3:
    if attempt > 1:
      echo "    Retry " & $attempt & "/3..."
      sleep(2000)
    else:
      echo "    Downloading for hash: " & url

    let client = newHttpClient()
    try:
      client.downloadFile(url, tempFile)

      var ctx: sha256
      ctx.init()

      let f = open(tempFile, fmRead)
      var buffer: array[8192, byte]

      while (let bytesRead = f.readBytes(buffer, 0, buffer.len); bytesRead > 0):
        ctx.update(addr buffer[0], uint(bytesRead))
      f.close()

      let digest = ctx.finish()
      result = ($digest).toLowerAscii()
      client.close()
      if fileExists(tempFile):
        removeFile(tempFile)
      return
    except CatchableError as e:
      lastError = e.msg
      echo "    !!! Attempt " & $attempt & " failed: " & e.msg
      client.close()
      if fileExists(tempFile):
        removeFile(tempFile)

  echo "    !!! FATAL: Could not compute hash after 3 attempts: " & lastError
  quit(1)

proc generate() =
  let client = newHttpClient()
  var releases: JsonNode

  echo "Fetching live releases.json..."
  try:
    releases = parseJson(client.getContent(releasesUrl))
  except:
    echo "Error: Could not fetch releases.json"
    return

  let templateContent = readFile(templatePath)

  for ver in targetVersions:
    if not releases.hasKey(ver):
      echo "!!! Version " & ver & " not found in releases.json"
      continue

    echo "Processing Nim " & ver & "..."
    let versionData = releases[ver]

    let archMap = {
      "linux_x64": (suffix: "AMD64", dir: "amd64"),
      "linux_arm64": (suffix: "ARM64", dir: "arm64v8"),
      "linux_x32": (suffix: "I386", dir: "i386"),
      "linux_armv7l": (suffix: "ARMHF", dir: "arm32v7"),
    }.toTable

    var rootContent = templateContent.replace("%%VERSION%%", ver)

    # First pass: fill in all URLs and SHAs in the template
    for jsonArch, data in archMap:
      if versionData.hasKey(jsonArch):
        let node = versionData[jsonArch]
        let url = node["github_url"].getStr()
        var sha: string
        if node.hasKey("digest"):
          sha = node["digest"].getStr().replace("sha256:", "")
        else:
          sha = getLocalSha256(url)

        rootContent = rootContent.replace("%%URL_" & data.suffix & "%%", url)
        rootContent = rootContent.replace("%%SHA_" & data.suffix & "%%", sha)
      else:
        rootContent = rootContent.replace("%%URL_" & data.suffix & "%%", "none")
        rootContent = rootContent.replace("%%SHA_" & data.suffix & "%%", "none")

    # Generate root Dockerfile for the version (multi-arch)
    let versionDir = "dockerfiles" / ver
    createDir(versionDir)
    writeFile(versionDir / "Dockerfile", rootContent)
    echo "  [SUCCESS] Generated Root: " & versionDir / "Dockerfile"


  client.close()

generate()
