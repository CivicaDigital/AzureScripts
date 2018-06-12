#!/bin/bash
source variables.sh

echo Deleting the resource group
az group delete --name $resourceGroup
