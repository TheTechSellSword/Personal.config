#!/bin/bash/

# Reference Link   : https://brave.com/linux/#release-channel-installation
# Signing Key Link : https://brave.com/signing-keys/#packages-release-channel

sudo zypper install curl

sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc

sudo zypper addrepo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo

sudo zypper install brave-browser
