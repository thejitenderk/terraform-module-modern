resource "azurerm_virtual_network" "virtual_network" {
  name                = var.name
  address_space       = var.address_space
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = var.tags

  dynamic "subnet" {
    for_each = var.subnets
    content {
      name             = subnet.key
      address_prefixes = subnet.value.address_prefixes
    }
  }
}
