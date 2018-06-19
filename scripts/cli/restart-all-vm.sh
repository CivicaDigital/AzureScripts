echo Sends a "Restarts" all machines on account with 'restart-tag'.
echo ---- LIST -----------------------------
az resource list --tag "restart-tag" --query "[?type=='Microsoft.Compute/virtualMachines'].name"
echo ---------------------------------------
az vm restart --no-wait --ids $(az resource list --tag "restart-tag" --query "[?type=='Microsoft.Compute/virtualMachines'].id" -o tsv)
echo Restart sent.
