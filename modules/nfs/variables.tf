variable "vpc_cidr_block" {
  default = "192.168.0.0/16"
  type    = string
}

variable "subnet_count" {
  default = 1
  type    = number
}

variable "route_table_cidr_block" {
  default = "0.0.0.0/0"
  type    = string
}

variable "nfs_ports_ingress" {
  type    = list(number)
  default = [22, 2049, 111]
}

variable "nfs_ports_egress" {
  type    = list(number)
  default = [0]
}

variable "user_data_path" {
  type    = string
  default = "./custom_data.sh"
}
