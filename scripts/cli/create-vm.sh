#!/bin/bash
source variables.sh $1
if [ -z "$2" ]; then echo "\$2 is empty needed for 'machineName'"; exit ; fi
if [ -z "$3" ]; then echo "\$3 is empty needed for 'admin-password'"; exit ; fi
if [ -z "$4" ]; then export vm_init_settings="./create-vm-simple.json" ; else export vm_init_settings=$4 ;  fi

source create-resource-group.sh

echo Creating machineName ${USER}-$2 
echo in resourceGroup ${resourceGroup}
echo With password $3

echo
echo Wait until provisioned ...
az vm create --verbose --resource-group $resourceGroup --name ${USER}-$2 --image UbuntuLTS --admin-username $USER --admin-password $3 --size Standard_D2_v2 --set tags.restart-tag=true

source wait-for-vm.sh

echo
echo Run extensions $vm_init_settings to set up VM ${USER}-$2
az vm extension set --resource-group $resourceGroup --vm-name ${USER}-$2 --name CustomScript --publisher Microsoft.Azure.Extensions --version 2.0 --protected-settings $vm_init_settings

echo ${USER}-$2 stated and set up.