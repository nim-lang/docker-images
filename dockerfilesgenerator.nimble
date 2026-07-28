packageName = "dockerfilesgenerator"
version = "0.1.0"
author = "Constantine Molchanov"
description = "Dockerfile Generator for the official Nim images"
license = "MIT"
srcDir = "."
binDir = "bin"
bin = @["dockerfilesgenerator", "libraryfilegenerator"]

requires "nim >= 2.2.10", "nimcrypto", "chronos"
