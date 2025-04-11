# Welcome to <img src="https://raw.githubusercontent.com/nim-lang/assets/master/Art/logo-crown.png" height="28px"/> Nim

![Docker Pulls](https://img.shields.io/docker/pulls/nimlang/nim?logo=nim)


Nim is a statically typed, imperative programming language that tries to give the programmer ultimate power without compromises on runtime efficiency. This means it focuses on compile-time mechanisms in all their various forms.

Beneath a nice infix/indentation based syntax with a powerful (AST based, hygienic) macro system lies a semantic model that supports a soft realtime GC on thread local heaps. Asynchronous message passing is used between threads,
so no "stop the world" mechanism is necessary. An unsafe shared memory heap is also provided for the increased efficiency that results from that model.

- [Official site](http://nim-lang.org)
- [Tutorials](http://nim-lang.org/learn.html)
- [Documentation](http://nim-lang.org/documentation.html)
- [Report an issue with images](https://github.com/nim-lang/docker-images/issues/new)


# Images Build Status

- ![Latest version](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fapi.github.com%2Frepos%2Fnim-lang%2Fdocker-images%2Factions%2Fworkflows%2F155124648%2Fruns%3Fstatus%3Dcompleted%26per_page%3D1&query=%24.workflow_runs%5B0%5D.run_started_at&label=Latest&color=green)
- ![2.2.x branch](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fapi.github.com%2Frepos%2Fnim-lang-ci%2Fdocker-images-regular%2Factions%2Fworkflows%2F155398794%2Fruns%3Fstatus%3Dcompleted%26per_page%3D1&query=%24.workflow_runs%5B0%5D.run_started_at&label=2.2.x&color=green)
- ![2.0.x branch](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fapi.github.com%2Frepos%2Fnim-lang-ci%2Fdocker-images-regular%2Factions%2Fworkflows%2F155398793%2Fruns%3Fstatus%3Dcompleted%26per_page%3D1&query=%24.workflow_runs%5B0%5D.run_started_at&label=2.0.x&color=green)
- ![1.6.x branch](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fapi.github.com%2Frepos%2Fnim-lang-ci%2Fdocker-images-regular%2Factions%2Fworkflows%2F155398792%2Fruns%3Fstatus%3Dcompleted%26per_page%3D1&query=%24.workflow_runs%5B0%5D.run_started_at&label=1.6.x&color=green)
- ![1.4.x branch](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fapi.github.com%2Frepos%2Fnim-lang-ci%2Fdocker-images-regular%2Factions%2Fworkflows%2F155398791%2Fruns%3Fstatus%3Dcompleted%26per_page%3D1&query=%24.workflow_runs%5B0%5D.run_started_at&label=1.4.x&color=green)
- ![1.2.x branch](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fapi.github.com%2Frepos%2Fnim-lang-ci%2Fdocker-images-regular%2Factions%2Fworkflows%2F155398790%2Fruns%3Fstatus%3Dcompleted%26per_page%3D1&query=%24.workflow_runs%5B0%5D.run_started_at&label=1.2.x&color=green)
- ![1.0.x branch](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fapi.github.com%2Frepos%2Fnim-lang-ci%2Fdocker-images-regular%2Factions%2Fworkflows%2F155398789%2Fruns%3Fstatus%3Dcompleted%26per_page%3D1&query=%24.workflow_runs%5B0%5D.run_started_at&label=1.0.x&color=green)
- ![0.x.x branch](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fapi.github.com%2Frepos%2Fnim-lang-ci%2Fdocker-images-regular%2Factions%2Fworkflows%2F155398787%2Fruns%3Fstatus%3Dcompleted%26per_page%3D1&query=%24.workflow_runs%5B0%5D.run_started_at&label=0.x.x&color=green)


# Tags

Tags indicate Nim versions, base images, and flavors. For example, `nimlang/nim:2.2.2-ubuntu-regular` means Nim version 2.2.2, based on Ubuntu, with Nimble installed. Ubuntu is the default base, so you can omit it in the tag: `nimlang/nim:2.2.2-regular`. Regular is the default flavor, so you can omit it as well: `nimlang/nim:2.2.2`. The latest Nim version is additionally tagged as `latest`: `nimlang/nim:latest`. And since Docker adds `latest` automatically, you can just write `nimlang/nim`.

So, all together:

nimlang/nim = nimlang/nim:latest = nimlang/nim:2.2.2 = nimlang/nim:2.2.2-ubuntu =nimlang/nim:latest-ubuntu = nimlang/nim:2.2.2-regular = nimlang/nim:latest-regular = nimlang/nim:2.2.2-ubuntu-regular = nimlang/nim:latest-ubuntu-regular

Phew, that's one long list! Fortunately, unless you need a specific version of Nim, you'll probably need just `nimlang/nim` or `nimlang/nim:alpine`.

Should you want to install a devel branch of the nim compiler or manage multiple nim version we have a `nimlang/choosenim` image, which provides `choosenim`. `choosenim` is a tool designed for managing your nim installation, read more [here](https://github.com/nim-lang/choosenim).


## Bases

There are currently two bases for `nimlang/nim` images: Ubuntu and Alpine. Ubuntu is the default one.

The `nimlang/choosenim` image is based on bitnami/minideb.


## Flavors

`nimlang/nim` images come in two flavors: *slim* and *regular*. Slim images include only the Nim compiler. Regular images include the compiler and [Nimble](https://github.com/nim-lang/nimble) package manager. 


# Using the Images

## Get the Latest Version

```shell
$ docker pull nimlang/nim
```

```shell
$ docker pull nimlang/choosenim
```


## Compiling a Single File

```shell
$ docker run --rm -v `pwd`:/usr/src/app -w /usr/src/app nimlang/nim nim c -r myapp.nim
```


## Compiling a *Static* Single File

```shell
$ docker run --rm -v `pwd`:/usr/src/app -w /usr/src/app nimlang/nim:alpine nim c --passL:"-static -no-pie" myapp.nim
```

