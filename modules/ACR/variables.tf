variable "acr_name" {
  type        = string
  description = "Acr name"
  default     = "myacr"

}
variable "acr_admin_enabled" {
  type        = bool
  description = "Admin enabled"
  default     = false

}
variable "sku" {
  type        = string
  description = "sku type"
  default     = "Standard"

}
