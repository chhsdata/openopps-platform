# AZURE VM template

This document describes failed efforts to utilize Azure's quickstart templates to create the hosting environment for Open Opps.

Within the Azure Portal...

Click *Create a resource*.
Run a search for "Template deployment", and select the top option of the same name.
Click *Create*.
Click *Build your own template in the editor*.

Here's our challenge. Azure provides a number of helpful deployment scripts for creating VMs that serve specific purposes. [One such script, which we want, sets up a Docker environment.](https://github.com/Azure/azure-quickstart-templates/tree/master/docker-simple-on-ubuntu) However, it's a little broken for our needs, as it's designed to work with commercial Azure. We need to make some modifications to deploy it on Government Azure.

Specifically, we need to remove the hardcoded reference to *blob.core.windows.net*. In [this file](https://github.com/Azure/azure-quickstart-templates/blob/master/docker-simple-on-ubuntu/azuredeploy.json), we're going to change this...

```json
"osDisk": {
  "name": "osdisk1",
  "vhd": {
    "uri": "[concat('http://',parameters('newStorageAccountName'),'.blob.core.windows.net/',variables('vmStorageAccountContainerName'),'/',variables('OSDiskName'),'.vhd')]"
  },
  "caching": "ReadWrite",
  "createOption": "FromImage"
}
```

...to this...

```json
"osDisk": {
  "name": "osdisk1",
  "vhd": {
    "uri": "[concat(reference(concat('Microsoft.Storage/storageAccounts/',parameters('newStorageAccountName')),'2015-06-15').primaryEndpoints.blob,variables('vmStorageAccountContainerName'),'/',variables('OSDiskName'),'.vhd')]"
  },
  "caching": "ReadWrite",
  "createOption": "FromImage"
}
```

For good measure, [I've forked this script on GitHub](https://github.com/xjensen/azure-quickstart-templates/blob/master/docker-simple-on-ubuntu/azuredeploy.json), so we can keep our own copy.

Download our modified copy of [azuredeploy.json](https://raw.githubusercontent.com/xjensen/azure-quickstart-templates/master/docker-simple-on-ubuntu/azuredeploy.json).

Click *Load file*.
Select *azuredeploy.json*.
Select *Save*.
Fill in the following values.
* Resource group: Pick "Use existing", then select the group in the drop-down
* New Storage Account Name: "openoppsdiskdev"
* Admin Username/Password: Ask Jon for credentials
* Dns Name for Public IP: "caopenoppsdev"
Select *Purchase*.

Azure will attempt to build the VM based upon the template, but it will fail with the following error. It doesn't work because Extensions seem to be unavailable in Azure Government.

```json
{"code":"DeploymentFailed","message":"At least one resource deployment operation failed. Please list deployment operations for details. Please see https://aka.ms/arm-debug for usage details.","details":[{"code":"NotFound","message":"{\r\n \"error\": {\r\n \"code\": \"ArtifactNotFound\",\r\n \"message\": \"Extension with publisher 'Microsoft.Azure.Extensions', type 'DockerExtension', and type handler version '1.0' could not be found in the extension repository.\"\r\n }\r\n}"}]}
```
