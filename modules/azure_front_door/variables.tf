variable "front_door_name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "enforce_backend_pools_certificate_name_check" {
  type    = bool
  default = false
}

variable "routing_rule_name" {
  type = string
  default = "exampleRoutingRule"
}

variable "accepted_protocols" {
  type    = list(string)
  default = ["Https"]
}

variable "patterns_to_match" {
  type    = list(string)
  default = ["/*"]
}

variable "frontend_endpoints" {
  type    = list(string)
  default = ["exampleFrontendEndpoint"]
}

variable "forwarding_protocol" {
  type    = string
  default = "HttpsOnly"
}

variable "backend_pool_name" {
  type = string
  default = "exampleBackendPool"
}

variable "backend_host_header" {
  type = string
}

variable "backend_address" {
  type = string
}

variable "backend_http_port" {
  type    = number
  default = 80
}

variable "backend_https_port" {
  type    = number
  default = 443
}

variable "front_door_host_name" {
  type = string
}
