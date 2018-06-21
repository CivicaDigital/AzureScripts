#!/bin/sh

# Install java 8
echo $(date) ":Installing Java 8" >> /usr/civica/cloud-init.txt
sudo apt-get install maven
mvnVer=$(mvn --version | grep "Apache Maven")

echo $(date) ":Installed Maven ${mvnVer}" >> /usr/civica/cloud-init.txt
