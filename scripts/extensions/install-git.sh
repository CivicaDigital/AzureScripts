#!/bin/sh

# Install GIT
## Should already be present
gitVar=$(git --version)
echo $(date) ":GIT Version ${gitVar}" >> /usr/civica/cloud-init.txt

