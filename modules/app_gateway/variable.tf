variable "app_gateway_name" {
  description = "The name of the Application Gateway."
}

variable "location" {
  description = "The location where the Application Gateway will be created."
}

variable "resource_group_name" {
  description = "The name of the resource group where the Application Gateway will be created."
}

variable "app_gateway_sku_name" {
  description = "The name of the SKU for the Application Gateway."
}

variable "app_gateway_sku_tier" {
  description = "The tier of the SKU for the Application Gateway."
}

variable "app_gateway_sku_capacity" {
  description = "The capacity of the SKU for the Application Gateway."
}

variable "app_gateway_subnet_id" {
  description = "The ID of the subnet where the Application Gateway will be deployed."
}