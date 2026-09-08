import std/[os, strutils, json, uri]
import chronos/apps/http/httpclient
import nimcrypto

const
  targetVersions = [
    "2.2.12", "2.2.10", "2.2.8", "2.2.6", "2.2.4", "2.2.2", "2.2.0",
    "2.0.14", "2.0.12", "2.0.10", "2.0.8", "2.0.6", "2.0.4", "2.0.2", "2.0.0",
  ]
  releasesUrl = "https://nim-lang.org/releases.json"

include "Dockerfile.nimf"

proc sha256Bytes(data: seq[byte]): string =
  var ctx: sha256
  ctx.init()
  ctx.update(unsafeAddr data[0], uint(data.len))
  result = ($ctx.finish()).toLowerAscii()

proc fetchSha(session: HttpSessionRef, url: string): Future[string] {.async.} =
  ## Fetch URL with up to 3 retries, return sha256 hex.
  var lastError = ""
  for attempt in 1 .. 3:
    if attempt > 1:
      echo "    Retry " & $attempt & "/3 for " & url
      await sleepAsync(2.seconds)
    else:
      echo "    Downloading for hash: " & url
    try:
      let resp = await session.fetch(parseUri(url))
      if resp.status < 200 or resp.status >= 300:
        raise newException(CatchableError, "HTTP " & $resp.status & " for " & url)
      result = sha256Bytes(resp.data)
      return
    except CatchableError as e:
      lastError = e.msg
      echo "    !!! Attempt " & $attempt & " failed: " & lastError
  echo "    !!! FATAL: Could not download after 3 attempts: " & lastError
  quit(1)

proc generate() =
  var releases: JsonNode

  echo "Fetching live releases.json..."
  let session = HttpSessionRef.new()
  try:
    let resp = waitFor session.fetch(parseUri(releasesUrl))
    releases = parseJson(bytesToString(resp.data))
  except:
    echo "Error: Could not fetch releases.json"
    return

  let archMap = [
    ("linux_x64", "amd64"),
    ("linux_arm64", "arm64"),
    ("linux_x32", "i386"),
    ("linux_armv7l", "armhf"),
  ]

  # First pass: gather all download tasks and version data
  type
    ArchData = object
      dpkgArch: string
      url: string
      sha: string
      downloadIdx: int

    VersionInfo = object
      version: string
      arches: seq[ArchData]

  var versions: seq[VersionInfo]
  var tasks: seq[string] # URLs to download

  for ver in targetVersions:
    if not releases.hasKey(ver):
      echo "!!! Version " & ver & " not found in releases.json"
      continue

    echo "Preparing Nim " & ver & "..."
    let versionData = releases[ver]

    var info = VersionInfo(version: ver)

    for (jsonArch, dpkgArch) in archMap:
      if versionData.hasKey(jsonArch):
        let node = versionData[jsonArch]
        let url = node["github_url"].getStr()
        var archData = ArchData(dpkgArch: dpkgArch, url: url, downloadIdx: -1)
        if node.hasKey("digest"):
          archData.sha = node["digest"].getStr().replace("sha256:", "")
        else:
          archData.downloadIdx = tasks.len
          tasks.add(url)
        info.arches.add(archData)

    versions.add(info)

  # Second pass: download all needed files concurrently
  if tasks.len > 0:
    echo "Downloading " & $tasks.len & " files concurrently..."
    var futures = newSeq[Future[string]](tasks.len)
    for i, url in tasks:
      futures[i] = fetchSha(session, url)
    waitFor allFutures(futures)
    var hashes = newSeq[string](tasks.len)
    for i, fv in futures:
      hashes[i] = fv.read()

    # Fill in downloaded hashes
    for v in versions.mitems:
      for a in v.arches.mitems:
        if a.downloadIdx >= 0:
          a.sha = hashes[a.downloadIdx]

  waitFor session.closeWait()

  # Third pass: generate Dockerfiles
  for info in versions:
    var arches: seq[ArchInfo]
    for a in info.arches:
      arches.add((dpkgArch: a.dpkgArch, url: a.url, sha: a.sha))

    let content = generateDockerfile(info.version, arches)

    let versionDir = "dockerfiles" / info.version
    createDir(versionDir)
    writeFile(versionDir / "Dockerfile", content)
    echo "  [SUCCESS] Generated Root: " & versionDir / "Dockerfile"

generate()
