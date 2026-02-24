# Nim Programming Language Official Docker Images

[Nim](https://nim-lang.org) is a statically typed, imperative programming language that focuses on efficiency, expressiveness, and elegance. It is designed to be as fast as C and as readable as Python, while offering a powerful macro system for metaprogramming.

These images provide a stable, multi-architecture environment for developing and deploying Nim applications.

## Key Features

- **Multi-Backend Support:** Includes the necessary toolchains for C, C++, and JavaScript compilation.
- **Precompiled Binaries:** Built using official Nim binaries for maximum reliability and consistency with the upstream releases.
- **Multi-Arch:** Native support for `amd64`, `arm64`, and `armv7` via Docker manifests.

## How to Use This Image

### Compile and Run (C Backend)

To compile a file named `main.nim` and execute it immediately:

```bash
docker run --rm -v "$(pwd)":/usr/src/app nimlang/nim:latest nim c -r main.nim
```

### Compile to JavaScript

Since Nim compiles to JS, this image includes Node.js to serve as the runtime for your scripts:

```bash
docker run --rm -v "$(pwd)":/usr/src/app your-repo/nim:latest nim js -r main.nim
```

### Managing Packages with Nimble

The image is configured with SSL support to allow nimble to install packages from remote repositories:

```bash
docker run --rm -v "$(pwd)":/usr/src/app your-repo/nim:latest nimble install -y
```

## Understanding the Tags

We use a "floating" tag strategy based on Semantic Versioning. This allows you to choose between absolute pinning or automatic updates for patches and minor versions.

- `latest`: Points to the most recent stable release.
- `2`: Points to the latest stable release in the 2.x.x series.
- `2.2`: Points to the latest stable release in the 2.2.x series.
- `2.2.8`: An immutable tag for a specific version.

## Supported Architectures

This image is a manifest list. Docker will automatically pull the correct layer for your CPU:

- `linux/amd64`
- `linux/arm64` (e.g., Apple Silicon, AWS Graviton)
- `linux/arm/v7` (e.g., Raspberry Pi 3/4)

## Maintenance

This repository is automatically updated via GitHub Actions. If you encounter any issues with the image structure or toolchain, please report them at https://github.com/nim-lang/docker-images/
