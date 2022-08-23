output "acr_name" {
  value = module.acr.acr_name
}

output "acr_password" {
  value = nonsensitive(module.acr.acr_password)
}

output "nfs_public_ip" {
  value = module.nfs.nfs_public_ip
}
