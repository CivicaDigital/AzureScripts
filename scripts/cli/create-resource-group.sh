#!/bin/bash
source variables.sh
echo Creating the resource group $resourceGroup.
az group create -n $resourceGroup -l $region

echo Add tags to the resource group $resourceGroup.
az group update -n $resourceGroup --set tags.CostCenter='{"Dept":"IT","Environment":"Test"}'
