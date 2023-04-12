resource "azurerm_key_vault" "key_vault" {
  name                = var.key_vault_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tenant_id           = var.tenant_id

  sku_name = "standard"

  access_policy {
    tenant_id = var.tenant_id
    object_id = var.object_id

    key_permissions = [
      "get",
    ]

    secret_permissions = [
      "get",
    ]
  }
}
