.PHONY: install_git_hooks install_scripts

GIT_HOOKS_DIR := $(shell git config core.hooksPath)
SCRIPTS_DIR := $(HOME)/scripts
BINARIES_DIR := $(HOME)/.local/bin

SCRIPTS := $(shell find . -type f -name '*.sh')
BINARIES := $(shell find . -type f | grep -Ev '^\./.*/' | grep -Ev '\.\w+' | grep -Ev '^Makefile')

install: install_binaries install_git_hooks install_scripts

install_binaries:
	mkdir -p $(BINARIES_DIR)
	$(foreach bin,$(BINARIES),ln -sf $(shell realpath $(bin)) $(BINARIES_DIR)/; )
	chmod a+x $(BINARIES_DIR)/*

install_git_hooks:
	mkdir -p $(GIT_HOOKS_DIR)
	ln -sf $(shell realpath git-hooks)/* $(GIT_HOOKS_DIR)/
	chmod a+x $(GIT_HOOKS_DIR)/*

install_scripts:
	mkdir -p $(SCRIPTS_DIR)
	$(foreach scr,$(SCRIPTS),ln -sf $(shell realpath $(scr)) $(SCRIPTS_DIR)/; )
	chmod a+x $(SCRIPTS_DIR)/*
