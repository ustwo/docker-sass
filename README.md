# ustwo sassc

This image is based on [Alpine](https://alpinelinux.org) to ensure a small base
image.

## Versions

* 3.3.0, latest
* 3.2.5

## Assumptions

* Workdir: `/home/ustwo`.

## Usage

```sh
$ docker run --rm -t \
    -v $(pwd)/input.scss:/home/ustwo/input.scss \
    ustwo/sass:3.3.0 \
      --sourcemap \
      --style compressed \
      input.scss output.css
```

## Maintainers

* Arnau Siches (arnau@ustwo.com)
