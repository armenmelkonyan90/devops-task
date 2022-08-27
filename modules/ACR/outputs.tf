output "acr_name" {
  value = azurerm_container_registry.acr.name

}
output "acr_password" {
  value = azurerm_container_registry.acr.admin_password
  # sensitive = true
}
