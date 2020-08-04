DOCKER_IMAGE_TAG?=latest
DOCKER_IMAGE_NAME=allopneus/ci-docker-ansible

.PHONY: build
build: ## builds the image locally
	docker build --pull -t $(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_TAG) .

.PHONY: push
push: ## pushes the image to the registry
	docker push $(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_TAG)