#!/bin/sh
echo $(date) ":Initialised from Azure Cloud CLI" >> /tmp/cloud-init.txt

# DESKTOP
# 1.  install xfce using apt
sudo apt-get --assume-yes update
echo $(date) ":OS Updated" >> /tmp/cloud-init.txt

sudo apt-get --assume-yes install xfce4
echo $(date) ":xfre4 installed" >> /tmp/cloud-init.txt

# 2. Install and configure a remote desktop server
# Now that you have a desktop environment installed, configure a remote desktop service to listen for incoming connections. xrdp is an open source Remote Desktop Protocol (RDP) server that is available on most Linux distributions, and works well with xfce.
# Tell xrdp what desktop environment to use when you start your session. Configure xrdp to use xfce .

echo $(date) ":Configure xrdp to use xfce" >> /tmp/cloud-init.txt

# Restart the xrdp service for the changes to take effect.
sudo apt-get --assume-yes install xrdp
echo xfce4-session >~/.xsession
sudo service xrdp restart

echo $(date) ":xrdp & xfce installed" >> /tmp/cloud-init.txt
