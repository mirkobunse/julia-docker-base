TAG_NAME         = "bunse/julia-docker-base:0.6.4"
CUSTOM_TAG_NAME  = $(subst :,:custom-,$(TAG_NAME))
EXAMPLE_TAG_NAME = "bunse/julia-docker-base-example"

# build the custom and the default tag
image:
	docker build \
	  --file=Dockerfile_custom \
	  --tag $(CUSTOM_TAG_NAME) .
	docker build \
	  --tag $(TAG_NAME) .

# push to a docker repository (e.g. DockerHub)
push:
	docker push $(CUSTOM_TAG_NAME)
	docker push $(TAG_NAME)

# build the example
example:
	docker build \
	  --build-arg group=`id --group --name` \
	  --build-arg gid=`id --group` \
	  --build-arg user=`id --user --name` \
	  --build-arg uid=`id --user` \
	  --tag $(EXAMPLE_TAG_NAME) \
	  example

.PHONY: image push example
