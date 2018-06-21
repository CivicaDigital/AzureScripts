#!/bin/sh
sudo mkdir -p /usr/civica
sudo touch /usr/civica/cloud-init.txt

# Install java 8
sudo echo $(date) ":Installing Eclipse STS" >> /usr/civica/cloud-init.txt

cd ~ 
wget -q http://download.springsource.com/release/STS/3.9.2.RELEASE/dist/e4.7/spring-tool-suite-3.9.2.RELEASE-e4.7.2-linux-gtk-x86_64.tar.gz -O spring-tool-suite.tar.gz
sudo tar -zxf spring-tool-suite.tar.gz -C /opt
rm spring-tool-suite.tar.gz
sudo mv /tmp/spring.desktop /usr/share/applications

sudo echo $(date) ":Installed Eclipse STS" >> /usr/civica/cloud-init.txt
