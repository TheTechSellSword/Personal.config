#!/bin/bash

# VARIABLES
brcPath="$HOME/.bashrc"
addDirectoryToPath="export PATH=$PATH:$(go env GOPATH)/bin"

go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.2
echo $addDirectoryToPath >> $brcPath

protoc-gen-go --version
protoc-gen-go-grpc --version