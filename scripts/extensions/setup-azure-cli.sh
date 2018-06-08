#!/bin/sh
echo $(date) ":Initialised from Azure Cloud CLI" >> /tmp/cloud-init.txt

# Azure CLI - https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-apt?view=azure-cli-latest
# 1. Modify your sources list:
AZ_REPO=$(lsb_release -cs)
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | sudo tee /etc/apt/sources.list.d/azure-cli.list
echo $(date) ":Source list modified" >> /tmp/cloud-init.txt

# 2. Get the Microsoft signing key:
curl -L https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
echo $(date) ":Microsoft signing key" >> /tmp/cloud-init.txt

# 3. Install the CLI:
sudo apt-get install apt-transport-https
sudo apt-get update && sudo apt-get install azure-cli
echo $(date) ":Azure CLI installed" >> /tmp/cloud-init.txt

