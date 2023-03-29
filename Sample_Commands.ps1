<# Example demo content for Terraform
tw 26/03/2023 #>

$SubID = '<Sub ID>'

New-AzResourceGroup -Location "westeurope" -Name 'tw-rg'

#if you wanted to create a SP for use by Terraform
#https://www.terraform.io/docs/providers/azurerm/guides/service_principal_client_secret.html
az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/$SubID"
#would output JSON block you can then use values in provider section of main.tf or define as environment variables

#Define base
$GitBasePath = 'D:\GitHub\Introduction_of_Terraform_in_Azure'

#Terraform Demo
#Install from https://www.terraform.io/downloads.html and added to user path
#Azure CLI installed and logged in via az login (Device Code)

Set-Location $GitBasePath\IntroBasicDeclarative

terraform fmt  #make my files formatted correctly and will fix all tf files in this folder

terraform init
terraform plan
terraform apply -auto-approve

#Human readable view of the state file
terraform show

#Show specific resource from state file
terraform state list
terraform state show azurerm_storage_account.StorAccount1
terraform state show azurerm_storage_container.Container1

terraform plan -var 'replicationType=GRS'
terraform apply -var 'replicationType=GRS' -auto-approve

#To visually see
terraform graph > base.dot
# could sent directly with graphviz installed https://graphviz.gitlab.io/download/
terraform graph | dot -Tsvg > graph.svg

#If resources changed outside of terraform and state not current
terraform refresh

#For secrets
Set-Location $GitBasePath\SecretOnly
#Set variable to avoid having in my source files. Could also use terraform.tfvars etc
$env:TF_VAR_KV="/subscriptions/$SubID/resourceGroups/tw-rg/providers/Microsoft.KeyVault/vaults/tw-akv"

terraform init
terraform plan
terraform apply


#To delete the resources
terraform plan -destroy -out='planout'   #Is there a file type to use? .tfplan??
terraform apply 'planout'
#or
terraform destroy
