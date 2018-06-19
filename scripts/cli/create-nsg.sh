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
# Step 3 - Create a Network Security Group
#---------------------------------------------------#

nsgName=${2}NSG
echo ================ ${nsgName} - Create NSG: $nsgName
az network nsg create --resource-group $resourceGroup --location $region --name $nsgName


#---------------------------------------------------#
# Step 4 - Add Ports to NSG.
#---------------------------------------------------#
echo
echo ================ ${nsgName} - Open Ports on NSG 

priority=900
variable=${3}
for i in $(echo $variable | sed "s/,/ /g")
do
    # call your procedure/other scripts here below    
	echo  ====== ${nsgName} Opening port on $i
	az network nsg rule create --resource-group $resourceGroup --nsg-name $nsgName --name Open-Port-${i} --protocol tcp --priority $priority --destination-port-range $i
	priority=$((priority + 1))

done


echo ================ ${nsgName} set up.