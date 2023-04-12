resource "azurerm_front_door" "front_door" {
  name                                         = var.front_door_name
  resource_group_name                          = var.resource_group_name
  enforce_backend_pools_certificate_name_check = false

  routing_rule {
    name               = "exampleRoutingRule"
    accepted_protocols = ["Https"]
    patterns_to_match  = ["/*"]
    frontend_endpoints = ["exampleFrontendEndpoint"]
    forwarding_configuration {
      forwarding_protocol = "HttpsOnly"
      backend_pool_name   = "exampleBackendPool"
    }
  }

  backend_pool {
    name = "exampleBackendPool"
    backend {
      host_header = var.backend_host_header
      address     = var.backend_address
      http_port   = var.backend_http_port
      https_port  = var.backend_https_port
    }
  }

  frontend_endpoint {
    name                              = "exampleFrontendEndpoint"
    host_name                         = var.front_door_host_name
    custom_https_provisioning_enabled = false
  }
}
