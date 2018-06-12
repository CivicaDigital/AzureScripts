#!/bin/bash
source variables.sh $1

source create-resource-group.sh

if [ -z "$1" ]; then echo "\$1 is empty needed for 'project_name'"; exit ; fi

echo Creating machineName ${USER}-$2 
echo in resourceGroup ${resourceGroup}
echo With password $2
echo az vm create --verbose --resource-group $resourceGroup --name ${USER}-$2 --image UbuntuLTS --admin-username $USER --admin-password $2 --size Standard_D2_v2 

source variables.sh

# Run extensions to set up VM
echo az vm extension set --resource-group $resourceGroup --vm-name ${USER}-$2 --name CustomScript --publisher Microsoft.Azure.Extensions --version 2.0 --protected-settings ./create-vm-simple.json
