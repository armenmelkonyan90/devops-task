variable "acr_name" {
  type        = string
  description = "Acr name"
  default     = "devopstaskacr1"

}
variable "acr_admin_enabled" {
  type        = bool
  description = "Admin enabled"
  default     = true

}
variable "sku" {
  type        = string
  description = "sku type"
  default     = "Standard"

}
variable "rg-name" {
  default = "elk-rg"

}
variable "rg-location" {
  default = "westeurope"

}