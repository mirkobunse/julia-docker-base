TAG_NAME         = "bunse/julia-docker-base:0.6.4"
CUSTOM_TAG_NAME  = $(subst :,:custom-,$(TAG_NAME))
EXAMPLE_TAG_NAME = "bunse/julia-docker-base-example"

image: custom
	docker build \
	  --tag $(TAG_NAME) .

custom:
	docker build \
	  --file=Dockerfile_custom \
	  --tag $(CUSTOM_TAG_NAME) .

example:
	docker build \
	  --build-arg group=`id --group --name` \
	  --build-arg gid=`id --group` \
	  --build-arg user=`id --user --name` \
	  --build-arg uid=`id --user` \
	  --tag $(EXAMPLE_TAG_NAME) \
	  example

.PHONY: image custom example
