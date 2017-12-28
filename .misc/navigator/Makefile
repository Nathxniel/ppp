.PHONY: all build install clean

all: build

build:
	cp template people
	sed -i 's/XXX/people/g' people
	sed -i 's/AAA/benchmark/g' people
	sed -i 's/BBB/exe/g' people
	sed -i 's/CCC/src/g' people
	cp template property
	sed -i 's/XXX/property/g' property
	sed -i 's/AAA/benchmark/g' property
	sed -i 's/BBB/init/g' property
	sed -i 's/CCC/src/g' property
	cp template programming
	sed -i 's/XXX/programming/g' programming
	sed -i 's/AAA/doc/g' programming
	sed -i 's/BBB/src/g' programming
	sed -i 's/CCC//g' programming
	cp template ppp
	sed -i 's/XXX/ppp/g' ppp
	sed -i 's/AAA/people/g' ppp
	sed -i 's/BBB/programming/g' ppp
	sed -i 's/CCC/property/g' ppp
	sed -i 's/cd ~/# cd ~/g' ppp
	
install: build
	cp -t /bin/ programming people property ppp

clean:
	rm -f people programming property ppp
