image_name := ustwo/sass
SASS_VERSION ?= 3.3.0

DOCKER_TASK := docker run --rm -it

build:
	@docker build -t $(image_name) .
.PHONY: build

shell:
	@$(DOCKER_TASK) --entrypoint=/bin/sh \
                  -v $(PWD):/home/ustwo/source \
                  $(image_name)
.PHONY: shell

version:
	@$(DOCKER_TASK) $(image_name)
.PHONY: version

release: alpine-sassc-$(SASS_VERSION).tar.gz
.PHONY: release

alpine-sassc-$(SASS_VERSION).tar.gz: sassc
	tar -zcvf $@ sassc

sassc:
	@$(DOCKER_TASK) --entrypoint=/bin/sh \
                  -v $(PWD):/home/ustwo \
                  $(image_name) -c "cp /usr/local/bin/sassc /home/ustwo/sassc"

clean:
	rm -rf alpine-sassc-$(SASS_VERSION).tar.gz sassc
.PHONY: clean


test: test-001 test-002
.PHONY: test

test-001:
	@$(DOCKER_TASK) -v $(PWD)/tests:/home/ustwo/tests \
                  $(image_name) --style compressed \
                                tests/test-001.sass
.PHONY: test-001

test-002:
	@$(DOCKER_TASK) -v $(PWD)/tests:/home/ustwo/tests \
                  $(image_name) --style compressed \
                                tests/test-002.scss
.PHONY: test-002
