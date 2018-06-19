#!/bin/bash
#---------------------------------------------------#
# Step 1 - Set up Environment variables 
#---------------------------------------------------#
if [ -z "$1" ]; then echo "\$1 is empty needed for 'project_name'"; exit ; fi
if [ -z "$2" ]; then echo "\$2 is empty needed for 'nsgName'"; exit ; fi
if [ -z "$3" ]; then echo "\$3 is empty needed for 'ports'"; exit ; fi

source variables.sh $1

#---------------------------------------------------#
# Step 2 - Create a resource Group
#---------------------------------------------------#
source create-resource-group.sh

#---------------------------------------------------#
# Step 3 - Create Network Security Groups
#---------------------------------------------------#
echo
echo ================ ${nsgName} - Open Ports on VM 

priority=900
variable=${3}
for i in $(echo $variable | sed "s/,/ /g")
do
    # call your procedure/other scripts here below    
	echo  ====== ${nsgName} Opening port on $i
	priority=$((priority + 1))
	az network nsg rule create --resource-group $resourceGroup --nsg-name ${2}NSG --name $2 --protocol tcp --priority $portNum --destination-port-range $i

done


echo ================ ${nsgName} set up.