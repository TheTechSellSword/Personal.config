#!/bin/bash

# VARIABLES
zipLink="https://github.com/protocolbuffers/protobuf/releases/download/v25.3/protoc-25.3-linux-x86_64.zip"
extractLocation="$HOME/.local"
brcPath="$HOME/.bashrc"
addDirectoryToPath="export PATH=$PATH:/$HOME/.local/bin"

cd ~/Downloads                          # Change to the ( /Downloads ) Directory
wget $zipLink                           # Download Zip
unzip $zipLink -d $extractLocation      # Extract to ( $HOME/.local )
echo $addDirectoryToPath >> $brcPath    # Add to Path ( $HOME/.bashrc )

protoc --version