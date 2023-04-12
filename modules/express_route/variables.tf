variable "express_route_circuit_name" {
  type        = string
  description = "Name of the ExpressRoute circuit"
}

variable "location" {
  type        = string
  description = "Location where the ExpressRoute circuit will be created"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group where the ExpressRoute circuit will be created"
}

variable "service_provider_name" {
  type        = string
  description = "Name of the service provider"
}

variable "peering_location" {
  type        = string
  description = "Name of the peering location"
}

variable "bandwidth_in_mbps" {
  type        = number
  description = "Bandwidth in Mbps for the ExpressRoute circuit"
}

variable "sku_tier" {
  type        = string
  description = "SKU tier for the ExpressRoute circuit"
}

variable "sku_family" {
  type        = string
  description = "SKU family for the ExpressRoute circuit"
}
