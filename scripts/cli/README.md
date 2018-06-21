# Client Scripts
## Overview
The scripts are all executable from the [Azure Cloud Shell](https://azure.microsoft.com/en-gb/features/cloud-shell/).
This project is a set of BASH scripts which run, troubleshoot and automate your most common management tasks.
The intent is to provide a common and easy method of provisioning Azure VMs.

### How does Azure Clous Shell Work
Azure Cloud Shell provides secure terminal access to a Linux Virtual Machine without the need to install and maintain a machine yourself. Azure Cloud Shell provisions machines on a per-request basis. It means that when you open your Cloud Shell, a Virtual Machine will be deployed automatically. Cloud Shell automatically terminates after 20 minutes of shell inactivity. That’s the reason why you must have an Azure storage account to store your files in an Azure file share. Cloud Shell will automatically attach a 5-GB disk image that stores your $Home directory contents for the future session.
Let’s see how it works. First, log in to the Azure Portal https://portal.azure.com and click on the Cloud Shell icon.
![Location of CLI](http://www.unicloud.com.au/wp-content/uploads/2018/03/Snip20180321_9.png)
Which will lead you to the following screen:
![Azure CLI](https://i1.wp.com/buildazure.com/wp-content/uploads/2018/02/Azure-Cloud-Shell-site-Bash.png?fit=654%2C395&ssl=1)
> [Azure Cloud Cli Primer](https://www.unicloud.com.au/blog/azure-cli-primer-azure-cloud-shell/)
## Getting the scripts
Once you have logged in you can fetch the scripts using GIT.
So in the users home directory run:
```
git clone https://github.com/CivicaDigital/AzureScripts.git
```
This places the files into `~/AzureScripts` folder.
## Accessing the Scripts
After cloning change to the AzureScripts directory.
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

## Allowing connectionout from VMs
While it is possible to have access on a specific port assigned to a VM it is more appropriate to use [Network Security Groups](https://docs.microsoft.com/en-us/azure/virtual-network/virtual-networks-create-nsg-arm-cli).
Therefore a set of appropriate security groupos should be created first.
This is done by running this command:
```
./create-nsg.sh [project] [nsg-name] [port-csv]
```

* This will create a resource group `[project]resourceGroup`.
* This will create a NSG called `[nsg-name]NSG' within the resource group `[project]resourceGroup`.
* Where port-csv:=port(,port-csv)
* With the following ports open `port-csv`.

> **NOTE** 
> If you don't include port `22` you will not be able to SSH to the server.
> If you don't include port `3389` you will not be able to RDP to the server.

eg.
```
./create-nsg.sh myProj desktop  8080,22,3389
```
Will create a group called `desktopNSG` with ports 8080, 22 & 3389 avalilable.

## Creating a Standard Linux VM
To create a VM simply run the following:
```
./create-vm.sh [project] [vm-name] [vm-password] [vm-scripts] [nsg-name]
```

* This will create a resource group `[project]resourceGroup`.
* This will create a VM called `[user]-[vm-name]` within a resource group `[project]resourceGroup`. (eg for user fred and [vm-name]=foobar then the VM will be 'fred-foobar').
* The VM needs a password (sooner than SSH keys) this password will be `[vm-password]'.
* The [vm-scripts] is a CSV list of scripts located in the [extensions](../extensions) folder. At a minimum this should include 'upgrade-os' as this will ensure the VM has an updated OS.
* The [nsg-name] is one of the Network Security Groups created previously. This is optional if only port 22 is required.

Running the script will probably take 5-10 minutes.
When created the VM will be created and will have the following properties:
* The OS will have been updated from the standard image `UbuntuLTS`;
* The VM will be on a `Standard_D2_v2`;
* The VM will have the tag `restart-tag`;
* The VM will have an auto shutdown enabled at 18:30 UTC.
* The VM will be attached to the NSG [nsg-name] and have all the associated ports open;

While running the extensions the VM will write to a file `/usr/civica/cloud-init.txt` can be examined to see which extensions have been executed; 
Note: This process can be checked by running:
```
az vm run-command invoke -g [project]ResourceGroup -n user-[vm-name] --command-id RunShellScript --scripts "more /usr/civica/cloud-init.txt"
```
Which will return the data in the file, thus enablng you to check the VM state.

## Creating a Linux VM with Azure CLI
To instantiate a VM with just the Azure CLI installed run the following command:
```
./create-vm.sh [project] [vm-name] [vm-password] setup-azure-cli
```

This is the same as a standard VM but the **setup-azure-cli** parameter is essential.
This means that the scripts located in the `setup-azure-cli.json` file will be executed on the VM as it is created.

## Creating a Linux VM with a Desktop
To instantiate a VM with just the Azure CLI installed run the following command:
```
./create-nsg.sh [project] desktop  22,3389
./create-vm.sh [project] [vm-name] [vm-password] setup-xrdp desktopNSG
```

This is the same as a Linux VM with Azure CLi as the scripts located in the `setup-xrdp.json` file are executed on the VM as it is created.
This script will attach the new VM to `3389` for connecting to the machine via RDP.





