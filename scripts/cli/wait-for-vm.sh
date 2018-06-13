#!/bin/bash
#
# Could be "az vm wait -g MyResourceGroup -n MyVm --created" but something moe interactive was desired.
#
if [ -z "$resourceGroup" ]; then echo "\$resourceGroup is empty"; exit ; fi

# Wait for the VMs to be provisioned
while [[ $(az vm list --resource-group $resourceGroup --query "length([?provisioningState=='Creating'])") != 0 ]]; do
    echo "The VMs are still not provisioned. Trying again in 20 seconds."
    sleep 20
    if [[ $(az vm list --resource-group $resourceGroup --query "length([?provisioningState=='Failed'])") != 0 ]]; then
        echo "At least one of the VMs failed to be provisioned."
        exit 1
    fi
done
echo "The VMs are provisioned."