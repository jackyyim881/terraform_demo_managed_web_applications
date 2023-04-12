variable "vnet_name" {
  description = "Name of the virtual network"
}

variable "vnet_address_space" {
  description = "Address space for the virtual network"
}

variable "location" {
  description = "Azure region where the resources will be deployed"
}

variable "resource_group_name" {
  description = "Name of the resource group to use for the deployment"
}

variable "gateway_subnet_prefix" {
  description = "CIDR block for the gateway subnet"
}

variable "web_tier_subnet_prefix" {
  description = "CIDR block for the web tier subnet"
}

variable "ci_cd_subnet_prefix" {
  description = "CIDR block for the CI/CD subnet"
}

variable "app_gateway_subnet_prefix" {
  description = "CIDR block for the application gateway subnet"
}
