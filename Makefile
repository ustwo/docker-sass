.PHONY: build shell test version

image_name := ustwo/sass

build:
	@docker build -t $(image_name) .

shell:
	@docker run --rm -it --entrypoint=/bin/sh $(image_name)

version:
	@docker run --rm -t $(image_name)

release: alpine-sassc-3.2.5.tar.gz

alpine-sassc-3.2.5.tar.gz:
	tar -zcvf $@ sassc

test: test-001 test-002

test-001:
	@docker run --rm -t \
		-v $(PWD)/tests:/home/ustwo/tests \
		$(image_name) \
		--style compressed \
		tests/test-001.sass

test-002:
	@docker run --rm -t \
		-v $(PWD)/tests:/home/ustwo/tests \
		$(image_name) \
		--style compressed \
		tests/test-002.scss
