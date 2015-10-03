.PHONY: build shell test version

image_name := ustwo/sass

build:
	@docker build -t $(image_name) .

shell:
	@docker run --rm -it --entrypoint=/bin/sh $(image_name)

version:
	@docker run --rm -t $(image_name)

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
