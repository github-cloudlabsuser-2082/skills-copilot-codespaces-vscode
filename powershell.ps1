
if (-not (Get-Module -Name Az)) {
    Install-Module -Name Az -Scope CurrentUser -Repository PSGallery -Force -AllowClobber
}

connect-azaccount

# Variables
$resourceGroupName = "example-resources"
$location = "East US"
$storageAccountName = "examplestoraccount"
$storageSkuName = "Standard_LRS" # Standard Locally Redundant Storage

# Create a new resource group
New-AzResourceGroup -Name $resourceGroupName -Location $location

# Create the storage account
New-AzStorageAccount -Name $storageAccountName `
                     -ResourceGroupName $resourceGroupName `
                     -Location $location `
                     -SkuName $storageSkuName `
                     -Kind "StorageV2" # General-purpose v2 account