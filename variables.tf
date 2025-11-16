variable "common_tags" {
  type = map(string)
}

variable "vnet_details" {
  type = map(object({
    vnet_name          = string
    vnet_address_space = list(string)
    resource_group_key = string
    tags               = optional(map(string))
    subnets = map(object({
      address_prefixes = list(string)
    }))
  }))
}


variable "rg_details" {
  type = map(object({
    name     = string
    location = optional(string)
    tags     = optional(map(string))
  }))
}
