resource "azurerm_resource_group" "main" {
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_container_registry" "acr" {
  name                = var.acr_name #"containerRegistry1"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  sku                 = var.sku #"Premium"
  admin_enabled       = var.acr_admin_enabled

}
