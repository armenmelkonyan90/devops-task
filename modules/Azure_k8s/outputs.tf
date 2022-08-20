output "aks_id" {
  value = azurerm_kubernetes_cluster.main.id
}

output "aks_fqdn" {
  value = azurerm_kubernetes_cluster.main.fqdn
}

output "aks_node_rg" {
  value = azurerm_kubernetes_cluster.main.node_resource_group
}

output "acr_id" {
  value = azurerm_container_registry.main.id
}
output "acr_name" {
  value = azurerm_container_registry.main.name
}
output "acr_username" {
  value = azurerm_container_registry.main.admin_username
}
output "acr_password" {
  value = azurerm_container_registry.main.admin_password
}
output "acr_login_server" {
  value = azurerm_container_registry.main.login_server
}

