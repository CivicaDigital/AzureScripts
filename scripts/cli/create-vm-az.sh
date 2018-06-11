export project_name="Dummy"
export region="UKWest"
export resourceGroup="${project_name}ResourceGroup"
#
# echo Creating machineName "${USER}-$1" 
# echo in resourceGroup "${resourceGroup}"
# echo With password "$2"
# echo Copy and paste this command...
#
# Create VM
echo az vm create --verbose --resource-group $resourceGroup --name ${USER}-$1 --image UbuntuLTS --admin-username $USER --admin-password $2 --size Standard_D2_v2 
# Run extensions to set up VM
echo az vm extension set --resource-group $resourceGroup --vm-name ${USER}-$1 --name CustomScript --publisher Microsoft.Azure.Extensions --version 2.0 --protected-settings ./create-vm-az.json
