#!/bin/sh
sudo mkdir -p /usr/civica
sudo touch /usr/civica/cloud-init.txt
sudo echo $(date) ":RAN setup-azure-cli.sh" >> /usr/civica/cloud-init.txt

sudo echo $(date) ":Initialised from Azure Cloud CLI" >> /usr/civica/cloud-init.txt

# Azure CLI - https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-apt?view=azure-cli-latest
# 1. Modify your sources list:
AZ_REPO=$(lsb_release -cs)
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | sudo tee /etc/apt/sources.list.d/azure-cli.list
sudo echo $(date) ":Source list modified" >> /usr/civica/cloud-init.txt

# 2. Get the Microsoft signing key:
curl -L https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo echo $(date) ":Microsoft signing key" >> /usr/civica/cloud-init.txt

# 3. Install the CLI:
sudo apt-get install apt-transport-https
sudo apt-get update && sudo apt-get install azure-cli
sudo echo $(date) ":Azure CLI installed" >> /usr/civica/cloud-init.txt