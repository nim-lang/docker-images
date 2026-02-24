# Welcome to <img src="https://raw.githubusercontent.com/nim-lang/assets/master/Art/logo-crown.png" height="28px"/> Nim

![Docker Pulls](https://img.shields.io/docker/pulls/nimlang/nim?logo=nim)

Nim is a statically typed, imperative programming language that tries to give the programmer ultimate power without compromises on runtime efficiency. This means it focuses on compile-time mechanisms in all their various forms.

Beneath a nice infix/indentation based syntax with a powerful (AST based, hygienic) macro system lies a semantic model that supports a soft realtime GC on thread local heaps. Asynchronous message passing is used between threads,
so no "stop the world" mechanism is necessary. An unsafe shared memory heap is also provided for the increased efficiency that results from that model.

- [Official site](http://nim-lang.org)
- [Tutorials](http://nim-lang.org/learn.html)
- [Documentation](http://nim-lang.org/documentation.html)
- [Report an issue with images](https://github.com/nim-lang/docker-images/issues/new)

## Bases

Images are available in two bases: Ubuntu and Alpine. Ubuntu is the default one.

## Slim

Slim images include only the Nim compiler. Regular images include the compiler, [Nimble](https://github.com/nim-lang/nimble) package manager, and tools like testament.

## Available Tags

- [`latest`, `2.2.8`, `2.2`, `2`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/2.2.8/regular/ubuntu/Dockerfile)
- [`slim`, `2.2.8-slim`, `2.2-slim`, `2-slim`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/2.2.8/slim/ubuntu/Dockerfile)
- [`alpine`, `2.2.8-alpine`, `2.2-alpine`, `2-alpine`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/2.2.8/regular/alpine/Dockerfile)
- [`alpine-slim`, `2.2.8-alpine-slim`, `2.2-alpine-slim`, `2-alpine-slim`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/2.2.8/slim/alpine/Dockerfile)
- [`2.2.6`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/2.2.6/regular/ubuntu/Dockerfile)
- [`2.2.6-slim`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/2.2.6/slim/ubuntu/Dockerfile)
- [`2.2.6-alpine`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/2.2.6/regular/alpine/Dockerfile)
- [`2.2.6-alpine-slim`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/2.2.6/slim/alpine/Dockerfile)
- [`2.2.4`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/2.2.4/regular/ubuntu/Dockerfile)
- [`2.2.4-slim`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/2.2.4/slim/ubuntu/Dockerfile)
- [`2.2.4-alpine`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/2.2.4/regular/alpine/Dockerfile)
- [`2.2.4-alpine-slim`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/2.2.4/slim/alpine/Dockerfile)
- [`2.2.2`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/2.2.2/regular/ubuntu/Dockerfile)
- [`2.2.2-slim`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/2.2.2/slim/ubuntu/Dockerfile)
- [`2.2.2-alpine`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/2.2.2/regular/alpine/Dockerfile)
- [`2.2.2-alpine-slim`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/2.2.2/slim/alpine/Dockerfile)
- [`2.2.0`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/2.2.0/regular/ubuntu/Dockerfile)
- [`2.2.0-slim`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/2.2.0/slim/ubuntu/Dockerfile)
- [`2.2.0-alpine`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/2.2.0/regular/alpine/Dockerfile)
- [`2.2.0-alpine-slim`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/2.2.0/slim/alpine/Dockerfile)
- [`2.0.14`, `2.0`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/2.0.14/regular/ubuntu/Dockerfile)
- [`2.0.14-slim`, `2.0-slim`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/2.0.14/slim/ubuntu/Dockerfile)
- [`2.0.14-alpine`, `2.0-alpine`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/2.0.14/regular/alpine/Dockerfile)
- [`2.0.14-alpine-slim`, `2.0-alpine-slim`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/2.0.14/slim/alpine/Dockerfile)
- [`2.0.12`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/2.0.12/regular/ubuntu/Dockerfile)
- [`2.0.12-slim`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/2.0.12/slim/ubuntu/Dockerfile)
- [`2.0.12-alpine`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/2.0.12/regular/alpine/Dockerfile)
- [`2.0.12-alpine-slim`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/2.0.12/slim/alpine/Dockerfile)
- [`2.0.10`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/2.0.10/regular/ubuntu/Dockerfile)
- [`2.0.10-slim`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/2.0.10/slim/ubuntu/Dockerfile)
- [`2.0.10-alpine`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/2.0.10/regular/alpine/Dockerfile)
- [`2.0.10-alpine-slim`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/2.0.10/slim/alpine/Dockerfile)
- [`2.0.8`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/2.0.8/regular/ubuntu/Dockerfile)
- [`2.0.8-slim`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/2.0.8/slim/ubuntu/Dockerfile)
- [`2.0.8-alpine`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/2.0.8/regular/alpine/Dockerfile)
- [`2.0.8-alpine-slim`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/2.0.8/slim/alpine/Dockerfile)
- [`2.0.6`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/2.0.6/regular/ubuntu/Dockerfile)
- [`2.0.6-slim`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/2.0.6/slim/ubuntu/Dockerfile)
- [`2.0.6-alpine`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/2.0.6/regular/alpine/Dockerfile)
- [`2.0.6-alpine-slim`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/2.0.6/slim/alpine/Dockerfile)
- [`2.0.4`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/2.0.4/regular/ubuntu/Dockerfile)
- [`2.0.4-slim`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/2.0.4/slim/ubuntu/Dockerfile)
- [`2.0.4-alpine`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/2.0.4/regular/alpine/Dockerfile)
- [`2.0.4-alpine-slim`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/2.0.4/slim/alpine/Dockerfile)
- [`2.0.2`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/2.0.2/regular/ubuntu/Dockerfile)
- [`2.0.2-slim`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/2.0.2/slim/ubuntu/Dockerfile)
- [`2.0.2-alpine`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/2.0.2/regular/alpine/Dockerfile)
- [`2.0.2-alpine-slim`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/2.0.2/slim/alpine/Dockerfile)
- [`2.0.0`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/2.0.0/regular/ubuntu/Dockerfile)
- [`2.0.0-slim`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/2.0.0/slim/ubuntu/Dockerfile)
- [`2.0.0-alpine`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/2.0.0/regular/alpine/Dockerfile)
- [`2.0.0-alpine-slim`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/2.0.0/slim/alpine/Dockerfile)
- [`1.6.20`, `1`, `1.6`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/1.6.20/regular/ubuntu/Dockerfile)
- [`1.6.20-slim`, `1-slim`, `1.6-slim`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/1.6.20/slim/ubuntu/Dockerfile)
- [`1.6.20-alpine`, `1-alpine`, `1.6-alpine`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/1.6.20/regular/alpine/Dockerfile)
- [`1.6.20-alpine-slim`, `1-alpine-slim`, `1.6-alpine-slim`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/1.6.20/slim/alpine/Dockerfile)
- [`1.6.18`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/1.6.18/regular/ubuntu/Dockerfile)
- [`1.6.18-slim`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/1.6.18/slim/ubuntu/Dockerfile)
- [`1.6.18-alpine`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/1.6.18/regular/alpine/Dockerfile)
- [`1.6.18-alpine-slim`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/1.6.18/slim/alpine/Dockerfile)
- [`1.6.16`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/1.6.16/regular/ubuntu/Dockerfile)
- [`1.6.16-slim`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/1.6.16/slim/ubuntu/Dockerfile)
- [`1.6.16-alpine`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/1.6.16/regular/alpine/Dockerfile)
- [`1.6.16-alpine-slim`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/1.6.16/slim/alpine/Dockerfile)
- [`1.6.14`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/1.6.14/regular/ubuntu/Dockerfile)
- [`1.6.14-slim`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/1.6.14/slim/ubuntu/Dockerfile)
- [`1.6.14-alpine`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/1.6.14/regular/alpine/Dockerfile)
- [`1.6.14-alpine-slim`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/1.6.14/slim/alpine/Dockerfile)
- [`1.6.12`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/1.6.12/regular/ubuntu/Dockerfile)
- [`1.6.12-slim`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/1.6.12/slim/ubuntu/Dockerfile)
- [`1.6.12-alpine`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/1.6.12/regular/alpine/Dockerfile)
- [`1.6.12-alpine-slim`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/1.6.12/slim/alpine/Dockerfile)
- [`1.6.10`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/1.6.10/regular/ubuntu/Dockerfile)
- [`1.6.10-slim`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/1.6.10/slim/ubuntu/Dockerfile)
- [`1.6.10-alpine`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/1.6.10/regular/alpine/Dockerfile)
- [`1.6.10-alpine-slim`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/1.6.10/slim/alpine/Dockerfile)
- [`1.6.8`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/1.6.8/regular/ubuntu/Dockerfile)
- [`1.6.8-slim`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/1.6.8/slim/ubuntu/Dockerfile)
- [`1.6.8-alpine`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/1.6.8/regular/alpine/Dockerfile)
- [`1.6.8-alpine-slim`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/1.6.8/slim/alpine/Dockerfile)
- [`1.6.6`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/1.6.6/regular/ubuntu/Dockerfile)
- [`1.6.6-slim`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/1.6.6/slim/ubuntu/Dockerfile)
- [`1.6.6-alpine`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/1.6.6/regular/alpine/Dockerfile)
- [`1.6.6-alpine-slim`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/1.6.6/slim/alpine/Dockerfile)
- [`1.6.4`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/1.6.4/regular/ubuntu/Dockerfile)
- [`1.6.4-slim`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/1.6.4/slim/ubuntu/Dockerfile)
- [`1.6.4-alpine`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/1.6.4/regular/alpine/Dockerfile)
- [`1.6.4-alpine-slim`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/1.6.4/slim/alpine/Dockerfile)
- [`1.6.2`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/1.6.2/regular/ubuntu/Dockerfile)
- [`1.6.2-slim`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/1.6.2/slim/ubuntu/Dockerfile)
- [`1.6.2-alpine`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/1.6.2/regular/alpine/Dockerfile)
- [`1.6.2-alpine-slim`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/1.6.2/slim/alpine/Dockerfile)
- [`1.6.0`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/1.6.0/regular/ubuntu/Dockerfile)
- [`1.6.0-slim`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/1.6.0/slim/ubuntu/Dockerfile)
- [`1.6.0-alpine`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/1.6.0/regular/alpine/Dockerfile)
- [`1.6.0-alpine-slim`](https://github.com/nim-lang/docker-images/blob/develop/Dockerfiles/1.6.0/slim/alpine/Dockerfile)

# Build Status

- ![Latest version](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fapi.github.com%2Frepos%2Fnim-lang%2Fdocker-images%2Factions%2Fworkflows%2F155124648%2Fruns%3Fstatus%3Dcompleted%26per_page%3D1&query=%24.workflow_runs%5B0%5D.run_started_at&label=Latest%20version&color=green)
- ![2.2.x branch](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fapi.github.com%2Frepos%2Fnim-lang-ci%2Fdocker-images-regular%2Factions%2Fworkflows%2F155398794%2Fruns%3Fstatus%3Dcompleted%26per_page%3D1&query=%24.workflow_runs%5B0%5D.run_started_at&label=2.2.x%20branch&color=green)
- ![2.0.x branch](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fapi.github.com%2Frepos%2Fnim-lang-ci%2Fdocker-images-regular%2Factions%2Fworkflows%2F155398793%2Fruns%3Fstatus%3Dcompleted%26per_page%3D1&query=%24.workflow_runs%5B0%5D.run_started_at&label=2.0.x%20branch&color=green)
- ![1.6.x branch](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fapi.github.com%2Frepos%2Fnim-lang-ci%2Fdocker-images-regular%2Factions%2Fworkflows%2F155398792%2Fruns%3Fstatus%3Dcompleted%26per_page%3D1&query=%24.workflow_runs%5B0%5D.run_started_at&label=1.6.x%20branch&color=green)

# Using the Images

## Get the Latest Version

```shell
$ docker pull nimlang/nim
```

## Compiling a Single File

```shell
$ docker run --rm -v `pwd`:/usr/src/app -w /usr/src/app nimlang/nim nim c -r myapp.nim
```

## Compiling a _Static_ Single File

```shell
$ docker run --rm -v `pwd`:/usr/src/app -w /usr/src/app nimlang/nim:alpine nim c --passL:"-static -no-pie" myapp.nim
```
