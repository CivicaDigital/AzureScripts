#!/bin/sh
mkdir -p /usr/civica
touch /usr/civica/cloud-init.txt

source install-java8.sh
source install-git.sh
source install-mvn.sh
source install-intellij.sh
source install-eclipse.sh
source install-postman.sh
source install-docker.sh
source install-desktop-icons.sh

