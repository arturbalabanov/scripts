.PHONY: install


install:
	mkdir -p $(shell git config core.hooksPath)
	ln -sf $(shell pwd)/git-hooks/* $(shell git config core.hooksPath)/
	chmod a+x $(shell git config core.hooksPath)/*
