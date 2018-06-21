#!/bin/sh
sudo mkdir -p /usr/civica
sudo touch /usr/civica/cloud-init.txt

sudo echo $(date) ":RAN upgrade-os.sh" >> /usr/civica/cloud-init.txt

# Apt-get options: https://linux.die.net/man/8/apt-get

echo $(date) "Updating packages ..." >> /usr/civica/cloud-init.txt
echo "Updating packages ..."
apt update
apt upgrade -y
sudo echo $(date) "... Updated packages." >> /usr/civica/cloud-init.txt
echo "Updated packages."
