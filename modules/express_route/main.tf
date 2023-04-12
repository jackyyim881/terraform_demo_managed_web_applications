resource "azurerm_express_route_circuit" "express_route_circuit" {
  name                  = var.express_route_circuit_name
  location              = var.location
  resource_group_name   = var.resource_group_name
  service_provider_name = var.service_provider_name
  peering_location      = var.peering_location
  bandwidth_in_mbps     = var.bandwidth_in_mbps

  sku {
    tier   = var.sku_tier
    family = var.sku_family
  }
}

