############################################
# General
############################################

variable "vm_admin_username" {
  description = "The username for the admin user"
  type        = string
}

variable "vm_admin_password" {
  description = "The password for the admin user"
  type        = string
}

variable "vm_name" {
  description = "The name of the VM"
  type        = string
}

variable "vm_location" {
  description = "The location/region for the VM"
  type        = string
}

variable "vm_size" {
  description = "The size of the VM"
  type        = string
}

variable "vm_resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

############################################
# Network
############################################

variable "vm_domain_name_label" {
  description = "The domain name label"
  type        = string
}

variable "vm_subnet_id" {
  description = "The ID of the subnet"
  type        = string
}

variable "vm_network_security_group_id" {
  description = "The ID of the network security group"
  type        = string
}

############################################
# Source image
############################################

variable "vm_source_image_publisher" {
  description = "The publisher of the source image"
  type        = string
}

variable "vm_source_image_offer" {
  description = "The offer of the source image"
  type        = string
}

variable "vm_source_image_sku" {
  description = "The SKU of the source image"
  type        = string
}

variable "vm_source_image_version" {
  description = "The version of the source image"
  type        = string
}

variable "vm_priority" {
  description = "The priority of the VM"
  type        = string
}

# variable "vm_eviction_policy" {
#   description = "The eviction policy of the VM"
#   type        = string
# }
