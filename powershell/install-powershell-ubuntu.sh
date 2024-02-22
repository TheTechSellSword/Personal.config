#!/bin/bash

ask-to-start-powershell(){
    echo "Do you want to start PowerShell? (Y/n)"
    read answer

    if [[ $answer == "Y" || $answer == "y" || $answer == "" ]];
    then
        echo "Starting powershell."
        pwsh                                                                                    # Start PowerShell
    else
        exit 0
    fi

}

###################################
# Prerequisites

sudo apt-get update                                                                             # Update the list of packages

# Install pre-requisite packages.
sudo apt-get install -y wget apt-transport-https software-properties-common                     # Get the version of Ubuntu
source /etc/os-release                                                                          # Reload OS to accept the above

wget -q https://packages.microsoft.com/config/ubuntu/$VERSION_ID/packages-microsoft-prod.deb    # Download the Microsoft repository keys
sudo dpkg -i packages-microsoft-prod.deb                                                        # Register the Microsoft repository keys

rm packages-microsoft-prod.deb                                                                  # Delete the Microsoft repository keys file
sudo apt-get update                                                                             # Update the list of packages after we added packages.microsoft.com

###################################
# Installation

sudo apt-get install -y powershell                                                              # Install PowerShell
ask-to-start-powershell                                                                         # Ask to START PowerShell