#!/bin/bash/

# Reference Link : https://support.brave.com/hc/en-us/articles/4404876135565-How-do-I-uninstall-Brave-

sudo zypper remove brave-browser brave-keyring
sudo zypper removerepo brave-browser
sudo rpm -e gpg-pubkey-c2d4e821
