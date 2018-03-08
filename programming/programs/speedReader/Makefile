.PHONY: all init build clean

all: build

init:
	mkdir -p ~/.speedReader

build:
	cabal install
	sudo cp src/zipwav /bin/

clean:
	cabal clean

uninstall: clean
	rm -rf ~/.speedReader
