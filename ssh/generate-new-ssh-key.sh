#!/bin/bash/

# ___UPDATE SYSTEM___

sudo apt update && sudo apt upgrade

# ___GENERATE NEW SSH-KEY___

echo "Enter Git Email."
read gitEmail

ssh-keygen -t ed25519 -C $gitEmail
