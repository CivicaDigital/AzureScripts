echo Starts all machines on account with 'restart-tag'.
echo ---- LIST -----------------------------
az resource list --tag "restart-tag" --query "[?type=='Microsoft.Compute/virtualMachines'].name"
echo ---------------------------------------
az vm start --ids $(az resource list --tag "restart-tag" --query "[?type=='Microsoft.Compute/virtualMachines'].id" -o tsv)
