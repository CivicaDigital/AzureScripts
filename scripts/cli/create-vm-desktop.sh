#!/bin/bash
source variables.sh

./create-vm.sh $1 $2 $3 create-vm-desktop
export vm_name=${USER}-$2
az vm open-port --resource-group $resourceGroup --name ${vm_name} --port 3389
