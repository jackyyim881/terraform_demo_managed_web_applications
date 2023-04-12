resource "azuread_application" "ad_application" {
  display_name = var.application_display_name
}

resource "azuread_service_principal" "ad_service_principal" {
  application_id = azuread_application.ad_application.application_id
}
