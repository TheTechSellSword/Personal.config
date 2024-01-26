#!/bin/bash/

# Description : This script changes the PORT NUMBER for SSH.




sudo apt update && sudo apt upgrade					# UPDATE SYSTEM
sudo sed -i.bak -e '40s/#   Port 22/Port 2222/' /etc/ssh/ssh_config	# CHANGE SSH Port Number to 2222

