#!/bin/bash/

# Reference Link   : https://brave.com/linux/#release-channel-installation
# Signing Key Link : https://brave.com/signing-keys/#packages-release-channel

sudo dnf install dnf-plugins-core

sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo

sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc

sudo dnf install brave-browser
