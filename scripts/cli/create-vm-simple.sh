#!/bin/bash
source variables.sh $1
if [ -z "$2" ]; then echo "\$2 is empty needed for 'machineName'"; exit ; fi
if [ -z "$3" ]; then echo "\$3 is empty needed for 'admin-password'"; exit ; fi

source create-resource-group.sh

echo Creating machineName ${USER}-$2 
echo in resourceGroup ${resourceGroup}
echo With password $3

echo Wait until provisioned ...
az vm create --verbose --resource-group $resourceGroup --name ${USER}-$2 --image UbuntuLTS --admin-username $USER --admin-password $3 --size Standard_D2_v2 

source wait-for-vm.sh

# Run extensions to set up VM
az vm extension set --resource-group $resourceGroup --vm-name ${USER}-$2 --name CustomScript --publisher Microsoft.Azure.Extensions --version 2.0 --protected-settings ./create-vm-simple.json
