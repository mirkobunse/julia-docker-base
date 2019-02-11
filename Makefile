TAG_NAME         = "bunse/julia-docker-base:0.6.4"
EXAMPLE_TAG_NAME = "bunse/julia-docker-base-example"

image:
	docker build --tag $(TAG_NAME) .
example:
	docker build --tag $(EXAMPLE_TAG_NAME) example

.PHONY: image example
