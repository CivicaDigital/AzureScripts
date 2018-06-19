#!/bin/bash
#---------------------------------------------------#
# Step 1 - Set up Environment variables 
#---------------------------------------------------#
source variables.sh $1
if [ -z "$2" ]; then echo "\$2 is empty needed for 'machineName'"; exit ; fi
if [ -z "$3" ]; then echo "\$3 is empty needed for 'admin-password'"; exit ; fi
if [ -z "$4" ]; then export vm_init_settings="./create-vm-simple.json" ; else export vm_init_settings="./${4}.json" ;  fi

#---------------------------------------------------#
# Step 2 - Create a resource Group
#---------------------------------------------------#
source create-resource-group.sh

#---------------------------------------------------#
# Step 3 - Create the machine
#---------------------------------------------------#

export vm_name=${USER}-$2
# export vm_image=UbuntuLTS
export vm_image=Canonical:UbuntuServer:18.04-LTS:18.04.201806130

echo Creating machineName ${vm_name} 
echo in resourceGroup ${resourceGroup}
echo With password $3

echo
echo Wait until provisioned ...
az vm create --verbose --resource-group $resourceGroup --name ${vm_name} --image ${vm_image} --admin-username $USER --admin-password $3 --size Standard_D2_v2 --tags "restart-tag" 

source wait-for-vm.sh
echo ${vm_name} started

#---------------------------------------------------#
# Step 4 - Add shutdown to machine
#---------------------------------------------------#


# Add shutdown using a devtestlabs ARM
echo ${vm_name} Adding shutdown...
export script_name="./instances/shutdown-${vm_name}.json"
mkdir -p ./instances
sed 's/YOURVMNAME/'${vm_name}'/g' < ./shutdown-vm.template >  $script_name
az group deployment create --name ${vm_name}Stop --resource-group $resourceGroup --template-file $script_name
echo ${vm_name} shutdown added


#---------------------------------------------------#
# Step 5 - Use Extensin scripts 
#---------------------------------------------------#

echo
echo Run extensions $vm_init_settings to set up VM ${vm_name}
az vm extension set --resource-group $resourceGroup --vm-name ${vm_name} --name CustomScript --publisher Microsoft.Azure.Extensions --version 2.0 --protected-settings $vm_init_settings

echo ${vm_name} started and set up.