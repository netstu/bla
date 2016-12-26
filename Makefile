VERSION?=dev

.PHONY: build
build: 
	go build -o bla cmd/bla/main.go

.PHONY: pkg
pkg:
	rm -rf .tmpBuildRoot
	mkdir .tmpBuildRoot
	mkdir -p .tmpBuildRoot/etc/bla/webroot
	mkdir -p .tmpBuildRoot/etc/systemd/system
	mkdir -p .tmpBuildRoot/etc/logrotate.d
	mkdir -p .tmpBuildRoot/usr/local/bin
	cp bla .tmpBuildRoot/usr/local/bin/

deb: build pkg
	fpm -t deb -s dir -n bla .tmpBuildRoot 
