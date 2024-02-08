#!/bin/bash


IFS=
#
# Setup the repository
#
echo "Would you like to install the public key, if you haven't already? (Y/n)"
read -r -s -n 1 answer

if [[ $answer == "Y" || $answer == "y" || $answer == "" || $answer == " " ]];then
    # Install the public key for the repository (if not done previously):
    curl -fsS https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo gpg --dearmor -o /usr/share/keyrings/packages-pgadmin-org.gpg

    # Create the repository configuration file:
    sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/packages-pgadmin-org.gpg] https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'
elif [[ $answer == "n" || $answer == "N" ]];then
    echo "Skipping Respository Installation and Configuration"
fi

#
# Install pgAdmin
#
echo "*****************************************"
echo "*       (1) Desktop & Web               *"
echo "*       (2) Desktop Only                *"
echo "*       (3) Web Only                    *"
echo "* Do you want to install, (1), (2), (3) *"
echo "*****************************************"
read mode

case $mode in
    1)
        # Install for both desktop and web modes:
        sudo apt install pgadmin4
        ;;
    2)
        # Install for desktop mode only:
        sudo apt install pgadmin4-desktop
        ;;
    3)
        # Install for web mode only: 
        sudo apt install pgadmin4-web
        # Configure the webserver, if you installed pgadmin4-web:
        sudo /usr/pgadmin4/bin/setup-web.sh
        ;;
esac

