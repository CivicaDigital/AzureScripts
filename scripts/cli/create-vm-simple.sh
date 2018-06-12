#!/bin/bash
source variables.sh
echo Creating the resource group
az group create -n $resourceGroup -l $region

echo Creating machineName ${USER}-$1 
echo in resourceGroup ${resourceGroup}
echo With password $2
echo az vm create --verbose --resource-group $resourceGroup --name ${USER}-$1 --image UbuntuLTS --admin-username $USER --admin-password $2 --size Standard_D2_v2 

source variables.sh

# Run extensions to set up VM
echo az vm extension set --resource-group $resourceGroup --vm-name ${USER}-$1 --name CustomScript --publisher Microsoft.Azure.Extensions --version 2.0 --protected-settings ./create-vm-simple.json
