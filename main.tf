provider "azurerm" {
  version = "~>2.0"
  features {}
}

locals {
  resource_group_name   = "test-terraform-group"
  location              = "us-east"
}

resource "azurerm_resource_group" "main" {
  name     = local.resource_group_name
  location = local.location
}

# Virtual Network 與子網
module "vnet" {
  source              = "./modules/vnet"
  resource_group_name = azurerm_resource_group.main.name
  location            = local.location
  address_space       = ["10.0.0.0/16"]
  subnet_prefixes     = {
    web_tier        = "10.0.1.0/24"
    app_gateway     = "10.0.2.0/24"
    db_tier         = "10.0.3.0/24"
  }
}



module "app_gateway" {
  source              = "./modules/app_gateway"
  resource_group_name = azurerm_resource_group.main.name
  location            = local.location
  subnet_id           = module.vnet.app_gateway_subnet_id
}


module "ase" {
  source              = "./modules/ase"
  resource_group_name = azurerm_resource_group.main.name
  location            = local.location
  subnet_id           = module.vnet.web_tier_subnet_id
}


module "sql" {
  source              = "./modules/sql"
  resource_group_name = azurerm_resource_group.main.name
  location            = local.location
  subnet_id           = module.vnet.db_tier_subnet_id
}

module "azure_front_door" {
  source              = "./modules/azure_front_door"
  resource_group_name = azurerm_resource_group.main.name
  location            = local.location
  frontend_host_name  = "example.azurefd.net"
}

module "azure_active_directory" {
  source              = "./modules/azure_active_directory"
  resource_group_name = azurerm_resource_group.main.name
  location            = local.location
  domain_name         = "localhost"
}
module "key_vault" {
  source              = "./modules/key_vault"
  resource_group_name = azurerm_resource_group.main.name
  location            = local.location
  sku_name            = "standard"
}


module "ddos_protection" {
  source              = "./modules/ddos_protection"
  resource_group_name = azurerm_resource_group.main.name
  location            = local.location
  ddos_protection_plan_name = "example-ddos-plan"
}

module "express_route" {
  source              = "./modules/express_route"
  resource_group_name = azurerm_resource_group.main.name
  location            = local.location
  peering_location    = "eastus2"
}


module "load_balancer" {
  source = "./modules/load_balancer"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location

  # Virtual network and subnet
  virtual_network_name = azurerm_virtual_network.example.name
  subnet_name           = azurerm_subnet.example.name

  # Public IP
  public_ip_name = azurerm_public_ip.example.name

  # Application Gateway
  app_gateway_name      = azurerm_application_gateway.example.name
  app_gateway_backend_pool_name = azurerm_application_gateway.example.backend_address_pool[0].name
}

