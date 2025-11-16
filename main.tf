module "rgs" {
  source   = "./modules/azurerm_rg"
  for_each = var.rg_details
  name     = each.value.name
  location = coalesce(each.value.location, "Central_US")
  tags     = coalesce(each.value.tags, {})
}


module "networks" {
  source              = "./modules/azurerm_networks"
  for_each            = var.vnet_details
  name                = each.value.vnet_name
  address_space       = each.value.vnet_address_space
  location            = module.rgs[each.value.resource_group_key].resource_group_location
  resource_group_name = module.rgs[each.value.resource_group_key].resource_group_name
  tags                = coalesce(each.value.tags, {})
  subnets             = each.value.subnets
}
