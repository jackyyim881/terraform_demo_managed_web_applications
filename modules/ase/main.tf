resource "azurerm_app_service_environment" "ase" {
  name                         = var.ase_name
  resource_group_name          = var.resource_group_name
  subnet_id                    = var.web_tier_subnet_id
  pricing_tier                 = var.ase_pricing_tier
  front_end_scale_factor       = var.ase_front_end_scal
}