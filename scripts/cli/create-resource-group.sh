# Create the resource group
az group create -n $resourceGroup -l $region
# Add tags to the resource group
az group update -n $resourceGroup --set tags.CostCenter='{"Dept":"IT","Environment":"Test"}'
