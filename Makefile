DOCKER_IMAGE?=ghcr.io/groupe-hevea/ci-docker-ansible
ANSIBLE_VERSION?=2.10
DOCKER_TAG?=$(DOCKER_IMAGE):$(ANSIBLE_VERSION)-latest

.PHONY: build
build: ## builds the image locally
	docker build --pull --build-arg ANSIBLE_VERSION=$(ANSIBLE_VERSION) -t $(DOCKER_TAG) .

.PHONY: push
push: ## pushes the image to the registry
	docker push $(DOCKER_TAG)

.PHONY: tag
tag: ## tag an image
	docker tag $(DOCKER_IMAGE) $(DOCKER_TAG)
