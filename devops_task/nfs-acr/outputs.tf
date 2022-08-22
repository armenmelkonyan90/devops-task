output "acr_name" {
  value = module.acr.acr_name

}
output "acr_password" {
  value = nonsensitive(module.acr.acr_password)
  # sensitive = true
}
output "nfs_public_ip" {
  value = module.nfs.nfs_public_ip

}
# output "nfs_junction" {
#   value = module.nfs.nfs_junction
# }

