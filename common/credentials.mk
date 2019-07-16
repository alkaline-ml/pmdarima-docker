SHELL := /bin/bash

.PHONY: docker-login
docker-login:
	echo ${DOCKER_PASSWORD} > pw.txt
	cat pw.txt | docker login -u=${DOCKER_USERNAME} --password-stdin
