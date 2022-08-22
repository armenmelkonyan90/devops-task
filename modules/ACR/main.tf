# resource "azurerm_resource_group" "main" {
#   name     = "example-resources"
#   location = "West Europe"
# }

resource "azurerm_container_registry" "acr" {
  name                = var.acr_name #"containerRegistry1"
  resource_group_name = var.rg-name
  location            = var.rg-location
  sku                 = var.sku #"Premium"
  admin_enabled       = var.acr_admin_enabled
  # admin_username = "devops"
  # admin_password = "devOpsforever"
}
