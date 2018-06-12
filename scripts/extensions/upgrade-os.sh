#!/bin/sh

# Apt-get options: https://linux.die.net/man/8/apt-get

echo $(date) "Updating packages ..." >> /tmp/cloud-init.txt
echo "Updating packages ..."
apt update
apt upgrade -y
echo $(date) "... Updated packages." >> /tmp/cloud-init.txt
echo "Updated packages."
