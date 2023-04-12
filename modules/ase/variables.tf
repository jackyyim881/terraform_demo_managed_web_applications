variable "ase_name" {
  description = "The name of the App Service Environment"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the App Service Environment will be created"
  type        = string
}

variable "web_tier_subnet_id" {
  description = "The ID of the subnet where the App Service Environment will be created"
  type        = string
}

variable "ase_pricing_tier" {
  description = "The pricing tier for the App Service Environment"
  type        = string
}

variable "ase_front_end_scal" {
  description = "The front-end scale factor for the App Service Environment"
  type        = number
}

variable "location" {
  description = "The location for the App Service Environment"
  type        = string
}