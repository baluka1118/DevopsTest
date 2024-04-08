[CmdletBinding()]
param(
    [Parameter(Mandatory = $True)]
    [string]
    $passwordSecret
    [Parameter(Mandatory = $True)]
    [string]
    $usernameSecret
    [Parameter(Mandatory = $True)]
    [string]
    $tenantSecret
)

# This logs into Azure with a Service Principal Account
Write-Output "Logging in to Azure with the secret password"
az login `
    --username $usernameSecret
    --password $passwordSecret `
    --tenant $tenantSecret
Write-Output "Done"
Write-Output ""

# creating the 
Write-Output "Creating resource group myGroup in region northeurope..."
az group create `
    --name 'myGroup' `
    --location 'northeurope'
    Write-Output "Done creating resource group"
    Write-Output ""

# creating the VM in the resource group created above
Write-Output "Creating VM..."
az vm create  `
        --resource-group 'myGroup' `
        --name 'demoVM' `
        --image win2019datacenter `
        --admin-username 'SecureAdminUser' `
        --admin-password 'SecureAdminPassword123'
Write-Output "Done creating VM"
Write-Output ""