variable "key_vault_name" {
  description = "Name of the key vault"
}

variable "location" {
  description = "Location for the key vault"
}

variable "resource_group_name" {
  description = "Name of the resource group for the key vault"
}

variable "tenant_id" {
  description = "ID of the tenant to associate with the key vault"
}

variable "object_id" {
  description = "ID of the object to associate with the key vault"
}
