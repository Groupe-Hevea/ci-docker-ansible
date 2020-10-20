DOCKER_IMAGE?=ci-docker-ansible
DOCKER_TAG?=$(DOCKER_IMAGE):latest
ANSIBLE_VERSION?=

.PHONY: build
build: ## builds the image locally
	docker build --pull --build-arg ANSIBLE_VERSION=$(ANSIBLE_VERSION) -t $(DOCKER_TAG) .

.PHONY: push
push: ## pushes the image to the registry
	docker push $(DOCKER_TAG)

.PHONY: tag
tag: ## tag an image
	docker tag $(DOCKER_IMAGE) $(DOCKER_TAG)
