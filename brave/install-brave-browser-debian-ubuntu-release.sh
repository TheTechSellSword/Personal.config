#!/bin/bash/

# Reference Link   : https://brave.com/linux/#release-channel-installation
# Signing Key Link : https://brave.com/signing-keys/#packages-release-channel

sudo apt install curl

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-broser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by="usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update

sudo apt install brave-browser
