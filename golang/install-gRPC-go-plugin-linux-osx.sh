#!/bin/bash

# VARIABLES
brcPath="$HOME/.bashrc"
addDirectoryToPath="export PATH=$PATH:/$HOME/.local/bin"

go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.1