# Nim Programming Language Official Docker Images

[Nim](https://nim-lang.org) is a statically typed, imperative programming language that focuses on efficiency, expressiveness, and elegance. It is designed to be as fast as C and as readable as Python, while offering a powerful macro system for metaprogramming.

These images provide a stable, multi-architecture environment for developing and deploying Nim applications.

## Key Features

- **Multi-Backend Support:** Compiles to C, C++, and JavaScript. GCC is included for native binaries.
- **Precompiled Binaries:** Built using official Nim binaries for maximum reliability and consistency with the upstream releases.
- **Multi-Arch:** Native support for `amd64`, `arm64/v8`, `i386`, and `arm32/v7` via Docker manifests.

## How to Use This Image

### Compile and Run (C Backend)

To compile a file named `main.nim`:

```bash
docker run --rm -v "$(pwd)":/usr/src/app nimlang/nim:latest nim c main.nim
```

To compile and immediately run:

```bash
docker run --rm -v "$(pwd)":/usr/src/app nimlang/nim:latest nim c -r main.nim
```

### Compile to JavaScript

To compile a .nim file to JS:

```bash
docker run --rm -v "$(pwd)":/usr/src/app nimlang/nim:latest nim js main.nim
```

To compile and run, use a multi-stage Dockerfile with Node.js:

```dockerfile
FROM nim AS builder
COPY . .
RUN nim js -o:app.js src/app.nim

FROM node:latest
COPY --from=builder /usr/src/app/app.js .
CMD ["node", "app.js"]
```

### Managing Packages with Nimble

The image is configured with SSL support to allow Nimble to install packages from remote repositories:

```bash
docker run --rm -v "$(pwd)":/usr/src/app nimlang/nim:latest nimble setup -y
```

To build a binary Nimble package:

```bash
docker run --rm -v "$(pwd)":/usr/src/app nimlang/nim:latest nimble build
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
- `linux/arm64/v8` (e.g., Apple Silicon, AWS Graviton)
- `linux/i386`
- `linux/arm32/v7`

## Maintenance

This repository is automatically updated via GitHub Actions. If you encounter any issues with the image structure or toolchain, please report them at https://github.com/nim-lang/docker-images/
