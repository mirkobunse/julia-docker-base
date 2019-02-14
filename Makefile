TAG_NAME    = "bunse/julia-docker-base"
TAG_VERSION = "0.6.4"

# build the custom and the default tag
image:
	docker build \
	  --file=Dockerfile_custom \
	  --tag $(TAG_NAME):custom \
	  --tag $(TAG_NAME):$(TAG_VERSION)-custom \
	  .
	docker build \
	  --tag $(TAG_NAME):latest \
	  --tag $(TAG_NAME):$(TAG_VERSION) \
	  .

# push to a docker repository (e.g. DockerHub)
push:
	docker push $(TAG_NAME):custom
	docker push $(TAG_NAME):$(TAG_VERSION)-custom
	docker push $(TAG_NAME):latest
	docker push $(TAG_NAME):$(TAG_VERSION)

# build the example
example:
	docker build \
	  --build-arg group=`id --group --name` \
	  --build-arg gid=`id --group` \
	  --build-arg user=`id --user --name` \
	  --build-arg uid=`id --user` \
	  --tag $(TAG_NAME)-example \
	  example

.PHONY: image push example
