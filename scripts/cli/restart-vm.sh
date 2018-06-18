#!/bin/bash
source variables.sh $1
if [ -z "$2" ]; then echo "\$2 is empty needed for 'machineName'"; exit ; fi
export vm_name=${USER}-$2
echo Restart machineName ${vm_name} 
echo in resourceGroup ${resourceGroup}

az vm restart -g ${resourceGroup} -n ${vm_name} 