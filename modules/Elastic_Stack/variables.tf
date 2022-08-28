variable "rg-name" {
  type        = string
  description = "resource group name"
  default     = "elk-rg"

}
variable "rg-location" {
  type        = string
  description = "resource group location"
  default     = "westeurope"

}
variable "vnet-name" {
  type        = string
  description = "virtual network name"
  default     = "elastic-network"

}
variable "subnet-name" {
  type        = string
  description = "subnet name"
  default     = "elastic-subnet"

}
variable "subnet-cidr" {
  type        = list(any)
  description = "subnet cidr"
  default     = ["10.0.2.0/24"]

}
variable "public-ip-name" {
  type        = string
  description = "public ip name"
  default     = "elastic-ip"

}
variable "public-ip-method" {
  type        = string
  description = "public ip method"
  default     = "Static"

}
variable "ni-name" {
  type        = string
  description = "network interface name"
  default     = "elastic-ni"

}
variable "ip-config-name" {
  type        = string
  description = "ip configuration name"
  default     = "elastic-ni-config"

}
variable "pv-ip-allocation" {
  type        = string
  description = "private ip adress allocation method"
  default     = "Dynamic"

}
variable "sg-name" {
  type        = string
  description = "sequrity group name"
  default     = "elastic-sg"

}
variable "vm-name" {
  type        = string
  description = "virtual machine name"
  default     = "elastic-vm"

}
variable "source-image-id" {
  type        = string
  description = "elastic search image id"
  default     = "/subscriptions/05a257df-6485-44a0-a551-8b67b0d8a5f5/resourceGroups/elk-rg/providers/Microsoft.Compute/images/elkimage"

}
variable "os-name" {
  type        = string
  description = "os disk name"
  default     = "elastic-os"

}
variable "os-cache" {
  type        = string
  description = "disk cacheing type"
  default     = "ReadWrite"

}
variable "os-create-option" {
  type        = string
  description = "disk create option"
  default     = "FromImage"

}
variable "os-disk-type" {
  type        = string
  description = "disk type"
  default     = "Standard_LRS"

}
variable "computer-name" {
  type        = string
  description = "virtual machine name"
  default     = "elastic"

}
variable "admin-username" {
  type        = string
  description = "virtual machine admin username"
  default     = "ubuntu"

}
variable "admin-password" {
  type        = string
  description = "virtual machine admin password"
  default     = "password123!"

}
variable "pass-auth" {
  type        = bool
  description = "disable password authentification"
  default     = true

}




















































