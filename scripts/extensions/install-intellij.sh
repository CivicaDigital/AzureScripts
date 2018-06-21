#!/bin/sh
mkdir -p /usr/civica
touch /usr/civica/cloud-init.txt

# Install java 8
echo $(date) ":Installing intellij" >> /usr/civica/cloud-init.txt

cd ~
wget -q https://download.jetbrains.com/idea/ideaIC-2017.3.4.tar.gz -O intellij.tar.gz
sudo tar -zxf intellij.tar.gz -C /opt
rm ~/intellij.tar.gz
sudo mv /tmp/intellij.desktop /usr/share/applications

echo $(date) ":Installed intellij" >> /usr/civica/cloud-init.txt
