module "rgs" {
  source   = "./modules/azurerm_rg"
  for_each = var.rg_details
  name     = each.value.name
  location = coalesce(each.value.location, "Central_US")
  tags     = coalesce(each.value.tags, var.common_tags, {})
}


module "networks" {
  source              = "./modules/azurerm_networks"
  for_each            = var.vnet_details
  name                = each.value.vnet_name
  address_space       = each.value.vnet_address_space
  location            = module.rgs[each.value.resource_group_key].resource_group_location
  resource_group_name = module.rgs[each.value.resource_group_key].resource_group_name
  tags                = coalesce(each.value.tags, var.common_tags, {})
  subnets             = each.value.subnets
}

module "linux_virtual_machine" {
  source              = "./modules/azurerm_lvm"
  for_each            = var.vm_details
  name                = each.key
  resource_group_name = module.rgs[each.value.resource_group_key].resource_group_name
  location            = module.rgs[each.value.resource_group_key].resource_group_location
  nic_name            = each.value.nic_name
  subnet_id           = module.networks[each.value.network_key].subnet_ids[each.value.subnet_key]
  size                = coalesce(each.value.vm_size, "Standard_B1s")
  admin_username      = each.value.admin_username
  admin_password      = each.value.admin_password
  image_publisher     = coalesce(each.value.image_publisher, "Canonical")
  image_offer         = coalesce(each.value.image_offer, "UbuntuServer")
  image_sku           = coalesce(each.value.image_sku, "18.04-LTS")
  tags                = coalesce(each.value.tags, var.common_tags, {})
}


module "network_security_groups" {
  source                 = "./modules/azurerm_nsg_with_rules"
  for_each               = var.nsg_details
  nsg_name               = each.value.name
  location               = module.rgs[each.value.resource_group_key].resource_group_location
  resource_group_name    = module.rgs[each.value.resource_group_key].resource_group_name
  security_rules         = each.value.security_rules
  network_interface_name = module.linux_virtual_machine[each.value.network_interface_name].network_interface_id
  tags                   = coalesce(each.value.tags, var.common_tags, {})
}
