SHELL := /bin/bash

.PHONY: docker-login
docker-login:
	docker login --username=${DOCKER_USERNAME} --email=${DOCKER_EMAIL}
