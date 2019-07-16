SHELL := /bin/bash

.PHONY: docker-login
docker-login:
	docker login -u=${DOCKER_USERNAME} -p=${DOCKER_PASSWORD}
