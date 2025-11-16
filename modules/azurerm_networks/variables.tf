variable "name" {
  description = "Name of the virtual network"
  type        = string
}

variable "address_space" {
  description = "Address space for the virtual network"
  type        = list(string)
}

variable "location" {
  description = "Azure region where the VNet will be deployed"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group where the VNet will be deployed"
  type        = string
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default     = {}
}

variable "subnets" {
  description = "Map of subnets to be created in the VNet"
  type = map(object({
    name             = optional(string)
    address_prefixes = list(string)
  }))
}
