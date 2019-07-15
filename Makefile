SHELL := /bin/bash

MAKEFILES := $(shell find . -name "Makefile" | grep -E "^./[^/]*/Makefile\$$")
MAKEDIRS := $(patsubst ./%, %, $(patsubst %/Makefile, %, $(MAKEFILES)))
BUILD_CMDS := $(patsubst %, build-%, $(MAKEDIRS))
CLEAN_CMDS := $(patsubst %, clean-%, $(MAKEDIRS))

.DEFAULT_GOAL := help

.PHONY: $(BUILD_CMDS)
$(BUILD_CMDS):
	@make -C $(strip $(patsubst build-%, %, $@)) build

.PHONY: build
build: $(BUILD_CMDS)

.PHONY: clean
clean: $(CLEAN_CMDS)


.PHONY: help
help:
	@echo "Detected sub-dir Makefiles:"
	@echo $(MAKEFILES) | tr [:space:] "\n"
	@echo
	@echo "Available build commands:"
	@echo "build"
	@echo $(BUILD_CMDS) | tr [:space:] "\n"
	@echo
	@echo "Available clean commands:"
	@echo "clean"
	@echo $(CLEAN_CMDS) | tr [:space:] "\n"
	@echo
