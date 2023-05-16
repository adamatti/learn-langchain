DOCKER_TAG=test:local
.DEFAULT_GOAL := help

.PHONY: help
help: ## show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

docker-build: ## build docker image
	docker build -t $(DOCKER_TAG) .

docker-sh: docker-build ## run docker image
	docker run -it --rm \
		-p 8080:5000 \
		--entrypoint /bin/bash \
		$(DOCKER_TAG)

