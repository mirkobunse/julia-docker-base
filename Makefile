IMAGE_NAME    = "bunse/julia-docker-base"
JULIA_VERSION = "0.6.4"

# build the custom and the default tag
image:
	docker build \
	  --build-arg JULIA_VERSION=$(JULIA_VERSION) \
	  --file=Dockerfile_custom \
	  --tag $(IMAGE_NAME):custom \
	  --tag $(IMAGE_NAME):$(JULIA_VERSION)-custom \
	  .
	docker build \
	  --tag $(IMAGE_NAME):latest \
	  --tag $(IMAGE_NAME):$(JULIA_VERSION) \
	  .

# push to a docker repository (e.g. DockerHub)
push:
	docker push $(IMAGE_NAME):custom
	docker push $(IMAGE_NAME):$(JULIA_VERSION)-custom
	docker push $(IMAGE_NAME):latest
	docker push $(IMAGE_NAME):$(JULIA_VERSION)

# build the example
example:
	docker build \
	  --build-arg group=`id --group --name` \
	  --build-arg gid=`id --group` \
	  --build-arg user=`id --user --name` \
	  --build-arg uid=`id --user` \
	  --tag $(IMAGE_NAME)-example \
	  example

.PHONY: image push example
