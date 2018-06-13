#!/bin/bash
if [ ! -n "$resourceGroup" ]
then

echo Setting Variables

if [ -z "$1" ]; then echo "\$1 is empty needed for 'project_name'"; exit ; fi

# Variables for All scripts, copy and paste into the command line.
export project_name="$1"
export region="UKWest"
export resourceGroup="${project_name}ResourceGroup"
export subscriptionId=$(az account list | jq '.[].id' | sed 's/[\"]//g')
echo Working in resourceGroup ${resourceGroup} in region ${region} and ${subscriptionId}.


fi

