variable "resource_group_location" {
  description = "Location of the resource group."
  type        = string
  default     = "westeurope"
}

variable "resource_group_name" {
  description = "Name of the resource group."
  type        = string
  default     = "dev_rg"
}

variable "admin_username" {
  description = "The username for the admin user"
  type        = string
  default     = null
}

variable "admin_password" {
  description = "The password for the admin user"
  type        = string
  default     = null
}

