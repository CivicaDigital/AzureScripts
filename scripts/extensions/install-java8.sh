#!/bin/sh
mkdir -p /usr/civica
touch /usr/civica/cloud-init.txt

# Install java 8
echo $(date) ":Installing Java 8" >> /usr/civica/cloud-init.txt
sudo apt install openjdk-8-jdk -y
echo $(date) ":Installed Java 8" >> /usr/civica/cloud-init.txt


