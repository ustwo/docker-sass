image_name := ustwo/sass
SASS_VERSION ?= 3.3.0

build:
	@docker build -t $(image_name) .
.PHONY: build

shell:
	@docker run --rm -it --entrypoint=/bin/sh \
                       -v $(PWD):/home/ustwo/source \
                       $(image_name)
.PHONY: shell

version:
	@docker run --rm -t $(image_name)
.PHONY: version

release: alpine-sassc-$(SASS_VERSION).tar.gz
.PHONY: release

alpine-sassc-$(SASS_VERSION).tar.gz:
	tar -zcvf $@ sassc

test: test-001 test-002
.PHONY: test

test-001:
	@docker run --rm -t -v $(PWD)/tests:/home/ustwo/tests \
                      $(image_name) --style compressed \
                                    tests/test-001.sass
.PHONY: test-001

test-002:
	@docker run --rm -t -v $(PWD)/tests:/home/ustwo/tests \
                      $(image_name) --style compressed \
                                    tests/test-002.scss
.PHONY: test-002
