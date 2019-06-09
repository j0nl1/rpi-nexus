.PHONY: build push

DOCKER_IMAGE_VERSION=1.0.3
DOCKER_IMAGE_NAME=j0nl1/nexus:$(DOCKER_IMAGE_VERSION)

build:
	docker build -t $(DOCKER_IMAGE_NAME)

push:
	docker push $(DOCKER_IMAGE_NAME)