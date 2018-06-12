#!/bin/bash
source variables.sh

# Delete the resource group
az group delete --name $resourceGroup
