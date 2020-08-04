SHELL := /bin/bash

# Used to be tgsmith61591
PREFIX = alkalineml

GIT_HASH = $(shell git rev-parse --verify HEAD | cut -c 1-7)
GIT_TAG = $(shell git describe --tags --exact-match $(GIT_HASH) 2>/dev/null)

PMDARIMA_VSN := 1.7.0

IMAGE = $(PREFIX)/$(IMAGE_NAME)
LOCAL = $(IMAGE):local
LATEST = $(IMAGE):latest
HASHED = $(IMAGE):$(GIT_HASH)
VERSIONED = $(IMAGE):$(PMDARIMA_VSN)


.PHONY: build
build:
	$(info # ############################################)
	$(info #)
	$(info # Now building $(IMAGE_NAME))
	$(info #)
	$(info # ############################################)
	docker build \
		--cache-from $(LATEST) \
		--build-arg PMDARIMA_VSN=$(PMDARIMA_VSN) \
		-t $(LOCAL) .
	docker tag $(LOCAL) $(HASHED)

.PHONY: clean
clean:
	rm VERSION || true

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

.PHONY: tag-latest
tag-latest:
	docker tag $(LOCAL) $(LATEST)

.PHONY: tag-version
tag-version:
	docker tag $(HASHED) $(VERSIONED)

.PHONY: check-pre-push
check-pre-push:
ifndef CIRCLECI
	$(error Pushing is only intended to be used on Circle CI)
endif

.PHONY: push-hashed
push-hashed: check-pre-push
	docker push $(HASHED)

.PHONY: push-latest
push-latest: check-pre-push
	docker push $(LATEST)

.PHONY: push-versioned
push-versioned: check-pre-push
	docker push $(VERSIONED)
