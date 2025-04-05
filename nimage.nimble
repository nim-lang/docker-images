# Package

version       = "1.0.0"
author        = "Constantine Molchanov"
description   = "Build and push Nim Docker images to Docker Hub."
license       = "MIT"
srcDir        = "src"
binDir        = "bin"
bin           = @["nimage"]


# Dependencies

requires "nim >= 2.2.2"
requires "climate >= 1.1.3"

