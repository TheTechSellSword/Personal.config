#!/bin/bash/

# Description : Configure GIT Username and Email

echo "Enter Git Username."
read gitName

echo "Enter Git Email."
read gitEmail

# ___CONFIGURE GIT___

git config --global user.name $gitName
git config --global user.email $gitEmail
