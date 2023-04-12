resource "azurerm_application_gateway" "app_gateway" {
  name                = var.app_gateway_name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku {
    name     = var.app_gateway_sku_name
    tier     = var.app_gateway_sku_tier
    capacity = var.app_gateway_sku_capacity
  }

  gateway_ip_configuration {
    name      = "gateway-ip-configuration"
    subnet_id = var.app_gateway_subnet_id
  }

  frontend_port {
    name = "frontend-port"
    port = 443
  }

  backend_address_pool {
    name = "backend-address-pool"
  }

  backend_http_settings {
    name                  = "backend-http-settings"
    cookie_based_affinity = "Disabled"
    port                  = 443
    protocol              = "Https"
  }

  http_listener {
    name                           = "http-listener"
    frontend_ip_configuration_name = "gateway-ip-configuration"
    frontend_port_name             = "frontend-port"
    protocol                       = "Https"
  }

  request_routing_rule {
    name                       = "request-routing-rule"
    rule_type                  = "Basic"
    http_listener_name          = "http-listener"
    backend_address_pool_name   = "backend-address-pool"
    backend_http_settings_name  = "backend-http-settings"
  }
}
