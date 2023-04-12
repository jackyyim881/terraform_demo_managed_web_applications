resource "azurerm_sql_server" "sql_server" {
  name                         = var.sql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = var.sql_server_version
  administrator_login          = var.sql_server_admin_login
  administrator_login_password = var.sql_server_admin_password

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_sql_database" "sql_database" {
  name                = var.sql_database_name
  resource_group_name = var.resource_group_name
  location            = var.location
  server_name         = azurerm_sql_server.sql_server.name
  edition             = var.sql_database_edition
  collation           = var.sql_database_collation

  tags = var.tags
}
