provider "azurerm" {
  version = "~>2.0"
  features {}
}

locals {
  resource_group_name   = "test-terraform-group"
  location              = "East Asia"
}

resource "azurerm_resource_group" "main" {
  name     = local.resource_group_name
  location = local.location
}

# Virtual Network 與子網
module "vnet" {
  source = "./modules/vnet"
  resource_group_name = azurerm_resource_group.main.name
  location            = local.location
}

# Application Gateway
module "app_gateway" {
  source = "./modules/app_gateway"
  resource_group_name = azurerm_resource_group.main.name
  location            = local.location
  subnet_id           = module.vnet.app_gateway_subnet_id
}

# App Service Environment
module "ase" {
  source = "./modules/ase"
  resource_group_name = azurerm_resource_group.main.name
  location            = local.location
  subnet_id           = module.vnet.web_tier_subnet_id
}

# Azure SQL Database
module "sql" {
  source = "./modules/sql"
  resource_group_name = azurerm_resource_group.main.name
  location            = local.location
}


module "azure_front_door" {
  source = "./modules/azure_front_door"

  # 提供子模塊所需的變數值
}

module "azure_active_directory" {
  source = "./modules/azure_active_directory"

  # 提供子模塊所需的變數值
}

module "key_vault" {
  source = "./modules/key_vault"

  # 提供子模塊所需的變數值
}

module "ddos_protection" {
  source = "./modules/ddos_protection"

  # 提供子模塊所需的變數值
}

module "express_route" {
  source = "./modules/express_route"

  # 提供子模塊所需的變數值
}
