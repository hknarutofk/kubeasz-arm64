#!/bin/bash
source /etc/profile
# export GOPATH=/root/go/
# export PATH=$PATH:$GOPATH/bin


go env -w GO111MODULE=on
go env -w GOPROXY=https://goproxy.io,direct
rice embed-go -i=./cli/serve 
CGO_ENABLED=0 go build -a -ldflags '-extldflags "-static"' -o bin/cfssl cmd/cfssl/cfssl.go
CGO_ENABLED=0 go build -a -ldflags '-extldflags "-static"' -o bin/cfssljson cmd/cfssljson/cfssljson.go 
CGO_ENABLED=0 go build -a -ldflags '-extldflags "-static"' -o bin/cfssl-certinfo cmd/cfssl-certinfo/cfssl-certinfo.go
file bin/*

