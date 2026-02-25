import std/[os, strutils, httpclient, json, tables]
import nimcrypto # Requires: nimble install nimcrypto

# Configuration
const
  targetVersions = [
    "2.2.8", "2.2.6", "2.2.4", "2.2.2", "2.2.0", "2.0.14", "2.0.12", "2.0.10", "2.0.8",
    "2.0.6", "2.0.4", "2.0.2", "2.0.0", "1.6.20", "1.6.18", "1.6.16", "1.6.14",
    "1.6.12", "1.6.10", "1.6.8", "1.6.6", "1.6.4", "1.6.2", "1.6.0",
  ]
  releasesUrl = "https://nim-lang.org/releases.json"
  templatePath = "Dockerfile.template"

proc getLocalSha256(url: string): string =
  ## Downloads binary to temp and hashes it using nimcrypto's streaming API.
  let client = newHttpClient()
  let tempFile = getTempDir() / "nim_binary_tmp.tar.xz"
  echo "    Downloading for hash: " & url

  try:
    client.downloadFile(url, tempFile)

    # Initialize nimcrypto SHA256 context
    var ctx: sha256
    ctx.init()

    let f = open(tempFile, fmRead)
    var buffer: array[8192, byte] # 8KB buffer for streaming

    while (let bytesRead = f.readBytes(buffer, 0, buffer.len); bytesRead > 0):
      # Update the hash with the current chunk
      ctx.update(addr buffer[0], uint(bytesRead))
    f.close()

    # Finalize and convert to hex string
    let digest = ctx.finish()
    result = $digest # nimcrypto's MDigest type converts to lowercase hex with $
  except CatchableError as e:
    echo "    !!! Error processing " & url & ": " & e.msg
    result = "0"
  finally:
    if fileExists(tempFile):
      removeFile(tempFile)
    client.close()

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

    let archMap =
      {"linux_x64": "AMD64", "linux_arm64": "ARM64", "linux_armv7l": "ARMV7"}.toTable

    var content = templateContent.replace("%%VERSION%%", ver)

    for jsonArch, templateSuffix in archMap:
      if versionData.hasKey(jsonArch):
        let node = versionData[jsonArch]
        let url = node["github_url"].getStr()

        let sha = getLocalSha256(url)

        content = content.replace("%%URL_" & templateSuffix & "%%", url)
        content = content.replace("%%SHA_" & templateSuffix & "%%", sha)
      else:
        content = content.replace("%%URL_" & templateSuffix & "%%", "none")
        content = content.replace("%%SHA_" & templateSuffix & "%%", "0")

    let dir = "dockerfiles" / ver
    createDir(dir)
    writeFile(dir / "Dockerfile", content)
    echo "  [SUCCESS] Generated: " & dir

  client.close()

generate()
