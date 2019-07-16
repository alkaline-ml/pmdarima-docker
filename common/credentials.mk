SHELL := /bin/bash

.PHONY: docker-login
docker-login:
	# To be used on Circle only
	env | grep DOCKER_PASSWORD | awk '{split($$0,a,"="); print a[2]}' > pwd.cred
	cat pwd.cred | docker login -u=${DOCKER_USERNAME} --password-stdin
