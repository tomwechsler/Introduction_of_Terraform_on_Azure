variable "resource_group_name" {
  default     = "twprodrg"
  description = "Name of the resource group."
}

variable "resource_group_location" {
  default     = "eastus"
  description = "Location of the resource group."
}

variable "virtual_network_name" {
  default     = "twprodvnet"
  description = "Name of the virtual network."
}

variable "virtual_subnet_name" {
  default     = "twprodsubnet"
  description = "Name of the virtual subnet."
}

variable "public_ip_name" {
  default     = "twpip2023"
  description = "Name of the pip."
}

variable "network_security_group_name" {
  default     = "twprodnsg"
  description = "Name of the NSG."
}

variable "network_nic_name" {
  default     = "twprodnic"
  description = "Name of the NIC."
}

variable "prefix" {
  type        = string
  default     = "win-vm-iis"
  description = "Prefix of the resource name"
}