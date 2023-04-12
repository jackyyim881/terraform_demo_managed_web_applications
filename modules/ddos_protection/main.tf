resource "azurerm_network_ddos_protection_plan" "ddos_protection_plan" {
  name                = var.ddos_protection_plan_name
  location            = var.location
  resource_group_name = var.resource_group_name
}
