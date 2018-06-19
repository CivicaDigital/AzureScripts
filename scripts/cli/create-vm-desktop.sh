#!/bin/bash
#---------------------------------------------------#
# Step 1 - Set up Environment variables 
#---------------------------------------------------#
source variables.sh

#---------------------------------------------------#
# Step 2 - Create a VM with the desktop scripts 
#---------------------------------------------------#
./create-vm.sh $1 $2 $3 setup-xrdp

#---------------------------------------------------#
# Step 3 - Open a port for RDP 
#---------------------------------------------------#
export vm_name=${USER}-$2
az vm open-port --resource-group $resourceGroup --name ${vm_name} --port 3389
