#!/bin/sh
sudo mkdir -p /usr/civica
sudo touch /usr/civica/cloud-init.txt

# Install java 8
sudo echo $(date) ":Installing Java 8" >> /usr/civica/cloud-init.txt
sudo apt install openjdk-8-jdk -y
sudo echo $(date) ":Installed Java 8" >> /usr/civica/cloud-init.txt


