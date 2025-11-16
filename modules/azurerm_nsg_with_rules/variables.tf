variable "nsg_name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "security_rules" {
  type = map(object({
    priority         = number
    direction        = string
    access           = string
    protocol         = string
    source_range     = string
    dest_range       = string
    address_prefixes = string
    dest_prefixes    = string
  }))
}

variable "network_interface_name" {
  type = string
}
