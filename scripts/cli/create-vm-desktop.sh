./create-vm.sh $1 $2 $3 create-vm-desktop
az vm open-port --resource-group $resourceGroup --name ${vm_name} --port 3389
