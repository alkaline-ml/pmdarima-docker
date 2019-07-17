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
push-versioned: check-pre-push VERSION
	docker push $(IMAGE):`cat VERSION`

.PHONY: tag-version
tag-version:
	# This makes the assumption that VERSION exists in the image, which it will
	# for all base distributions that are not Circle images
	docker run \
		--rm -it \
		$(LOCAL) \
		/bin/bash -c 'cat VERSION' > VERSION
	docker tag $(HASHED) $(IMAGE):`cat VERSION`

	# Leave version so we can use it to push
	# rm VERSION
