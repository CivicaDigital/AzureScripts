#!/bin/sh
sudo mkdir -p /usr/civica
sudo touch /usr/civica/cloud-init.txt

# Install java 8
sudo echo $(date) ":Installing Java 8" >> /usr/civica/cloud-init.txt
sudo apt-get install maven
mvnVer=$(mvn --version | grep "Apache Maven")

sudo echo $(date) ":Installed Maven ${mvnVer}" >> /usr/civica/cloud-init.txt
