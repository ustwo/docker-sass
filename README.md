# ustwo sassc

This image is based on [Alpine](https://alpinelinux.org) to ensure a small base
image.

## Versions

* 3.3.6, latest
* 3.3.0
* 3.2.5

## Assumptions

* Workdir: `/home/ustwo`.

## Usage

```sh
$ docker run --rm -t \
    -v $(pwd)/input.scss:/home/ustwo/input.scss \
    ustwo/sass:3.3.6 \
      --sourcemap \
      --style compressed \
      input.scss output.css
```

## Contact

* open.source@ustwo.com


## Maintainers

* Arnau Siches (arnau@ustwo.com)


## License

Licensed under [MIT](./LICENSE).
