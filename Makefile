SHELL := /bin/bash

include ./common/credentials.mk

MAKEFILES := $(shell find . -name "Makefile" | grep -E "^./[^/]*/Makefile\$$")
MAKEDIRS := $(patsubst ./%, %, $(patsubst %/Makefile, %, $(MAKEFILES)))
BUILD_CMDS := $(patsubst %, build-%, $(MAKEDIRS))
TAG_LATEST_CMDS := $(patsubst %, tag-latest-%, $(MAKEDIRS))

.DEFAULT_GOAL := help

.PHONY: $(BUILD_CMDS)
$(BUILD_CMDS):
	@make -C $(strip $(patsubst build-%, %, $@)) build

.PHONY: build
build: $(BUILD_CMDS)

.PHONY: $(TAG_LATEST_CMDS)
$(TAG_LATEST_CMDS):
	@make -C $(strip $(patsubst tag-latest-%, %, $@)) tag-latest

.PHONY: tag-with-latest
tag-latest: $(TAG_LATEST_CMDS)

.PHONY: help
help:
	@echo "Detected sub-dir Makefiles:"
	@echo $(MAKEFILES) | tr [:space:] "\n"
	@echo
	@echo "Available build commands:"
	@echo "build"
	@echo $(BUILD_CMDS) | tr [:space:] "\n"
	@echo
	@echo "Available tag commands:"
	@echo "tag-with-latest"
	@echo $(TAG_LATEST_CMDS) | tr [:space:] "\n"
	@echo
