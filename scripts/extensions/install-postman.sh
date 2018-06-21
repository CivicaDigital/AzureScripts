#!/bin/sh
sudo mkdir -p /usr/civica
sudo touch /usr/civica/cloud-init.txt

# Install java 8
sudo echo $(date) ":Installing Postman" >> /usr/civica/cloud-init.txt

cd ~
# Install this package to get required libraries
sudo apt-get install libxss1
wget -q https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz
sudo tar -xzf postman.tar.gz -C /opt
rm postman.tar.gz
sudo ln -s /opt/Postman/Postman /usr/bin/postman


sudo mv /tmp/postman.desktop /usr/share/applications

sudo echo $(date) ":Installed Postman" >> /usr/civica/cloud-init.txt
