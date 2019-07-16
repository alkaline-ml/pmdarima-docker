SHELL := /bin/bash

.PHONY: docker-login
docker-login:
	env | grep DOCKER_PASSWORD | awk '{split($0,a,"="); print a[2]}' | docker login -u=${DOCKER_USERNAME} --password-stdin
