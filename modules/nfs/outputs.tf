output "nfs_public_ip" {
  value = aws_instance.virtual_instance_1.public_ip
}
