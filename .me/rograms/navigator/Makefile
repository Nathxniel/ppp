.PHONY: all build install clean

all: build

build:
	sh .build.sh

install: build
	cp -t /bin/ programming people property ppp

clean:
	rm -f people programming property ppp
