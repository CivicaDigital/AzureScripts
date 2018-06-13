# Client Scripts
## Overview
The scripts are all executable from the Azure Cloud CLI.
## Getting the scripts
In the users home directory run:
```
git clone https://github.com/CivicaDigital/AzureScripts.git
```
This places the files into `~AzureScripts` folder.
## Accessing the Scripts
After cloning change to the scripst directory.
```
cd AzureScripts/scripts/cli/
```
## Readying the scripts to be run
It is possible that the scripts already exist in the folder in question.
In this case they may need updating from the GIT repo and making executable.
This is done as follows:
```
git reset --hard origin/master & git pull
chmod +x *.sh
```
Running `ll` will allow you to confirm that all the scripts are runnable.

## Creating a Standard Linux VM
To create a VM simply run the following:
```
./create-vm.sh [project] [vm-name] [vm-password]
```

* This will create a VM within a resource group `[project]resourceGroup`.
* The VM created will not be the value of the parameter [vm-name], but `user-[vm-name]`. (eg for user fred and [vm-name]=foobar then the VM will be 'fred-foobar').
* The VM needs a password (sooner than SSH keys) this password will be `[vm-password]'.

Running the script will probably take 5-10 minutes.
Whe created the VM will be created and will have the following properties:
* The OS will have been updated from the standard image `UbuntuLTS`;
* The VM will be on a `Standard_D2_v2`;
* The VM will have the tag `restart-tag`;
* The file `/tmp/cloud-init.txt` can be examined to see which extensions have been executed; 
Note: This process can be checked by running:
`az vm run-command invoke -g [project]ResourceGroup -n user-[vm-name] --command-id RunShellScript --scripts "more /tmp/cloud-init.txt"`
Which will return the data in the file, thus enablng you to check the VM state.
* The VM will have an auto shutdown enabled at 18:30 UTC.

## Creating a Linux VM with Azure CLI
To instantiate a VM with just the Azure CLI installed run the following command:
```
./create-vm.sh [project] [vm-name] [vm-password] create-vm-az
```

This is the same as a standard VM but the **create-vm-az** parameter is essential.
This means that the scripts located in the `create-vm-az.json` file will be executed on the VM as it is created.





