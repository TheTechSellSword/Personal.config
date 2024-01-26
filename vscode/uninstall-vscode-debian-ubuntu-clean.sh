#!/bin/bash/

# Reference Link : https://code.visualstudio.com/docs/setup/uninstall

sudo apt-get remove code
sudo apt-get remove --auto-remove --purge code

rm -rf $HOME/.config/Code
rm -rf ~/.vscode