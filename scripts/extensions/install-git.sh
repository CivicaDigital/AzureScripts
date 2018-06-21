#!/bin/sh
sudo mkdir -p /usr/civica
sudo touch /usr/civica/cloud-init.txt

# Install GIT
## Should already be present
gitVar=$(git --version)
sudo echo $(date) ":GIT Version ${gitVar}" >> /usr/civica/cloud-init.txt

