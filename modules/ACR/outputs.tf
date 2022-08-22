output "acr_username" {
  value = azurerm_container_registry.acr.admin_username

}
output "acr_password" {
  nonsensitive(sha256(azurerm_container_registry.acr.admin_password))
}
