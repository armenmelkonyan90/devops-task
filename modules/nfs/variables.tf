# variable "nfs_resource_group_name" {
#   type        = string
#   description = "Nfs resource group name"
#   default     = "nfs_rg"
# }
# variable "nfs_location" {
#   type        = string
#   description = "Nfs resource group location"
#   default     = "westeurope"
# }
variable "rg-name" {
  type = string
  description = "elk image resource group name"
  default = "elk-rg"
  
}
variable "rg-location" {
  type = string
  description = "elk image resource group location"
  default = "westeurope"
  
}
variable "vnet_name" {
  type        = string
  description = "Kubernetes namespace for fluentd"
  default     = "nfs-vnet"
}
variable "vnet_cidr" {
  type        = list(any)
  description = "Kubernetes namespace for fluentd"
  default     = ["10.0.0.0/16"]
}
variable "hpc_subnet_name" {
  type        = string
  description = "Kubernetes namespace for fluentd"
  default     = "hpc-subnet"
}
variable "hpc_subnet_cidr" {
  type        = list(any)
  description = "Kubernetes namespace for fluentd"
  default     = ["10.0.1.0/24"]

}
variable "hpc_cache_name" {
  type        = string
  description = "Kubernetes namespace for fluentd"
  default     = "hpccache"

}
variable "admin_username" {
  type = string
  description = "Admin user name"
  default = "adminuser"
  
}
variable "hpc_cache_size" {

  description = "Kubernetes namespace for fluentd"
  default     = 3072
}
variable "hpc_sku_name" {
  type        = string
  description = "Kubernetes namespace for fluentd"
  default     = "Standard_2G"
}
variable "vm_subnet_name" {
  type        = string
  description = "Kubernetes namespace for fluentd"
  default     = "nfs-vm-subnet"
}
variable "vm_subnet_cidr" {
  type        = list(any)
  description = "Kubernetes namespace for fluentd"
  default     = ["10.0.2.0/24"]
}
variable "ni_name" {
  type        = string
  description = "Kubernetes namespace for fluentd"
  default     = "nfs-ni"
}
variable "ip_config_name" {
  type        = string
  description = "Kubernetes namespace for fluentd"
  default     = "internal"
}
variable "pr_ip_allocation" {
  type        = string
  description = "Kubernetes namespace for fluentd"
  default     = "Dynamic"
}

variable "prefix" {
  type        = string
  description = "Kubernetes namespace for fluentd"
  default     = "nfs-server"
}
variable "nfs_vm_size" {
  type        = string
  description = "Kubernetes namespace for fluentd"
  default     = "Standard_DS1_v2"
}

variable "os_caching" {
  type        = string
  description = "Kubernetes namespace for fluentd"
  default     = "ReadWrite"
}
variable "sa_type" {
  type        = string
  description = "Kubernetes namespace for fluentd"
  default     = "Standard_LRS"

}
variable "hpcCNT_name" {
  type        = string
  description = "hpc cache nfs target"
  default     = "hpcnfstarget"

}
variable "usage_model" {
  type        = string
  description = "hpcCNT usage model"
  default     = "READ_HEAVY_INFREQ"

}
variable "sg_name" {
  type        = string
  description = "sequrity group name"
  default     = "nfs_sg1"
}
