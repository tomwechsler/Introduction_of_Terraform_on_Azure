resource "azurerm_resource_group" "twrg" {
  name     = var.azure_rg_name
  location = var.azure_location

  tags = local.tags

}

# Create virtual network
resource "azurerm_virtual_network" "twvnet" {
  name                = var.virtual_network_name
  address_space       = ["10.40.0.0/16"]
  location            = azurerm_resource_group.twrg.location
  resource_group_name = azurerm_resource_group.twrg.name

  tags = local.tags

}

# Create subnet
resource "azurerm_subnet" "twsubnet" {
  name                 = var.virtual_subnet_name
  resource_group_name  = azurerm_resource_group.twrg.name
  virtual_network_name = azurerm_virtual_network.twvnet.name
  address_prefixes     = ["10.40.1.0/24"]
}

# Create public IP
resource "azurerm_public_ip" "twpip" {
  name                = var.public_ip_name
  location            = azurerm_resource_group.twrg.location
  resource_group_name = azurerm_resource_group.twrg.name
  allocation_method   = "Dynamic"
}

# Create Network Security Group and rules
resource "azurerm_network_security_group" "twnsg" {
  name                = var.network_security_group_name
  location            = azurerm_resource_group.twrg.location
  resource_group_name = azurerm_resource_group.twrg.name

  security_rule {
    name                       = "RDP"
    priority                   = 1000
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "web"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = local.tags

}