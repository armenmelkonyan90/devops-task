output "acr_username" {
  value = module.acr.acr_username

}
output "acr_password" {
  value = module.acr.acr_password
  sensitive = true
}
output "nfs_public_ip" {
  value = module.nfs.nfs_public_ip

}
output "nfs_junction" {
  value = module.nfs.nfs_junction
}

