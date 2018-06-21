#!/bin/sh
mkdir -p /usr/civica
touch /usr/civica/cloud-init.txt

# Install Docker - https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-using-the-repository
echo $(date) ":Installing Docker" >> /usr/civica/cloud-init.txt

## Update the apt package index:
sudo apt-get update

## Install packages to allow apt to use a repository over HTTPS:
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common

## Add Docker’s official GPG key:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

## Echo PGP
dockKey=$(sudo apt-key fingerprint 0EBFCD88)

echo $(date) ": Docker Key: ${dockKey}" >> /usr/civica/cloud-init.txt

## set up the stable repository
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update

## Install
sudo apt-get install docker-ce -y

dockVer=$(docker -v)

echo $(date) ":Installed Docker ${dockVer}" >> /usr/civica/cloud-init.txt


