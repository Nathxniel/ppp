.PHONY: all init build install

all: install

build:
	cabal install

init:
	mkdir ~/.fame

install: init build
	cp -rt ~/.fame src/getData.js src/getInput.js src/node_modules
