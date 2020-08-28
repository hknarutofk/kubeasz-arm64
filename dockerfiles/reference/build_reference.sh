#!/bin/bash

yum install golang -y
(
	cd etcd-3.4.3
	export GOPROXY=https://goproxy.io
	go get
	./build
)

(
	cd compose-1.23.2/
	sh script/build/linux
)
