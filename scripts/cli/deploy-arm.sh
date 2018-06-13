#!/bin/bash
# FROM: https://gist.github.com/ramnov/7dbcd640df4da4f838715fa8bdf29863

source variables.sh $1

#set -e

#Start deployment
echo "Starting deployment..."
(
	set -x
	azure group deployment create --name $deploymentName --resource-group $resourceGroup --template-file $templateFilePath --parameters-file $parametersFilePath --verbose
)

if [ $?  == 0 ]; 
 then
	echo "Template has been successfully deployed"
fi
