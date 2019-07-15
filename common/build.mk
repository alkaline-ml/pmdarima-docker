SHELL := /bin/bash

PREFIX = tgsmith61591

GIT_HASH = $(shell git rev-parse --verify HEAD | cut -c 1-7)
GIT_TAG = $(shell git describe --tags --exact-match $(GIT_HASH) 2>/dev/null)

IMAGE = $(PREFIX)/$(IMAGE_NAME)
LOCAL = $(IMAGE):local
LATEST = $(IMAGE):latest
HASHED = $(IMAGE):$(GIT_HASH)


.PHONY: build
build:
	$(info # ############################################)
	$(info #)
	$(info # Now building $(IMAGE_NAME))
	$(info #)
	$(info # ############################################)
	docker build \
		--cache-from $(LATEST) \
		-t $(LOCAL) .
	docker tag $(LOCAL) $(HASHED)

.PHONY: push-hashed
push-hashed:
ifndef CIRCLECI
	$(error Pushing is only intended to be used on Circle CI)
else
	docker push $(HASHED)
endif

.PHONY: pull-hashed
pull-hashed:
	docker pull $(HASHED)
	docker tag $(HASHED) $(LOCAL)

.PHONY: pull-latest
pull-latest:
	docker tag $(LATEST) $(LATEST)-$(REVISION) || true
	docker pull $(LATEST) || true

.PHONY: pull-base
pull-base:
	docker pull $(BASE)
	docker tag $(BASE) $(BASE_LOCAL)
