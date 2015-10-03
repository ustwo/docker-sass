# ustwo sassc

This image is based on [Alpine](https://alpinelinux.org) to ensure a small base
image.

## Versions

* 3.2.5, latest

## Assumptions

* Workdir: `/home/ustwo`.

## Usage

    $ docker run --rm -t \
        -v $(PWD)/input.scss:/home/ustwo/input.scss \
        ustwo/sass:3.2.5 \
          --sourcemap \
          --style compressed \
          input.scss output.css

## Maintainers

* [Arnau Siches](mailto:arnau@ustwo.com)
