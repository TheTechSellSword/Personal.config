#!/bin/bash/

# Reference Link : https://code.visualstudio.com/docs/setup/linux

# We currently ship the stable 64-bit VS Code in a yum repository, the following script will install the key and repository:

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

# Then update the package cache and install the package using dnf (Fedora 22 and above):

dnf check-update
sudo dnf install code # or code-insiders