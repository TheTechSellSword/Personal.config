#!/bin/bash

# VARIABLES
ver18="18"
ver20="20"
ver21="21"
verLTS="lts"
verCurrent="current"

downloadNodeVersion() {
	echo "Starting download"
	curl -fsSL https://deb.nodesource.com/setup_$1.x | sudo -E bash - &&\
		sudo apt-get install -y nodejs
}

echo "Choose Node Version (v21.x) (v20.x) (v18.x) (Latest Stable) (Current)"
echo "Enter (21) or (20) or (18) or (lts) or (crt)"
read version

if [ $version = 18 ]; then downloadNodeVersion $ver18
elif [ $version = 20 ]; then downloadNodeVersion $ver20
elif [ $version = 21 ]; then downloadNodeVersion $ver21
elif [ $version = lts || $version = LTS ]; then downloadNodeVersion $verLTS
elif [ $version = crt || $version = CRT ]; then downloadNodeVersion $verCurrent
else echo "Sorry you entered something incorrectly. Try Again."
fi		
