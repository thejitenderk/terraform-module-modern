variable "common_tags" {
  type = map(string)
}

variable "vnet_details" {
  type = map(object({
    vnet_name          = string
    vnet_address_space = list(string)
    resource_group_key = string
    tags               = optional(map(string))
    subnets = optional(map(object({
      address_prefixes = list(string)
    })), {})
  }))
}


variable "rg_details" {
  type = map(object({
    name     = string
    location = optional(string)
    tags     = optional(map(string))
  }))
}


variable "vm_details" {
  type = map(object({
    nic_name           = string
    admin_username     = string
    admin_password     = string
    resource_group_key = string
    network_key        = string
    subnet_key         = string
    vm_size            = optional(string)
    image_publisher    = optional(string)
    image_offer        = optional(string)
    image_sku          = optional(string)
    tags               = optional(map(string))
  }))
}


variable "nsg_details" {
  type = map(object({
    name                   = string
    resource_group_key     = string
    network_interface_name = string
    tags                   = optional(map(string))
    security_rules = map(object({
      priority         = number
      direction        = optional(string, "Inbound")
      access           = optional(string, "Allow")
      protocol         = optional(string, "Tcp")
      source_range     = optional(string, "*")
      dest_range       = optional(string, "*")
      address_prefixes = optional(string, "*")
      dest_prefixes    = optional(string, "*")
    }))
  }))
}
