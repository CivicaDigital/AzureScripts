#!/bin/sh
mkdir -p /usr/civica
touch /usr/civica/cloud-init.txt

# Apt-get options: https://linux.die.net/man/8/apt-get

echo $(date) "Updating packages ..." >> /usr/civica/cloud-init.txt
echo "Updating packages ..."
apt update
apt upgrade -y
echo $(date) "... Updated packages." >> /usr/civica/cloud-init.txt
echo "Updated packages."
