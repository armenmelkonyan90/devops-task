output "nfs_public_ip" {
  value = azurerm_linux_virtual_machine.main.public_ip_address

}
output "nfs_junction" {
  value = azurerm_hpc_cache_nfs_target.main.namespace_junction

}
