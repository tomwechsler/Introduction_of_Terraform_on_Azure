variable "azure_rg_name" {
  type        = string
  description = "The Azure RG Name"
  default     = "tw-prod-rg"
}

variable "azure_location" {
  type        = string
  description = "The Azure Region"
  default     = "West Europe"
}

variable "virtual_network_name" {
  default     = "twprodvnet"
  description = "Name of the virtual network"
}

variable "virtual_subnet_name" {
  default     = "twprodsubnet"
  description = "Name of the virtual subnet"
}

variable "public_ip_name" {
  default     = "twpipvm2023"
  description = "Name of the pip"
}

variable "network_security_group_name" {
  default     = "twprodnsg"
  description = "Name of the NSG."
}