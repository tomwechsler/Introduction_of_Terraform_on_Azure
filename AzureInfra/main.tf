resource "azurerm_resource_group" "twrg" {
  name     = var.azure_rg_name
  location = var.azure_location

  tags = local.tags

}

## azurerm_virtual_network

## azurerm_subnet