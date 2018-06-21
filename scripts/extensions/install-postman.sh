#!/bin/sh
mkdir -p /usr/civica
touch /usr/civica/cloud-init.txt

# Install java 8
echo $(date) ":Installing Postman" >> /usr/civica/cloud-init.txt

cd ~
# Install this package to get required libraries
sudo yum -y -q install libXScrnSaver
wget -q https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz
sudo tar -xzf postman.tar.gz -C /opt
rm postman.tar.gz
sudo ln -s /opt/Postman/Postman /usr/bin/postman
sudo mv /tmp/postman.desktop /usr/share/applications


echo $(date) ":Installed Postman" >> /usr/civica/cloud-init.txt
