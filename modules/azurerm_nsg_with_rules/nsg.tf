resource "azurerm_network_security_group" "network_security_group" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags


  dynamic "security_rule" {
    for_each = var.security_rules
    content {
      name                       = security_rule.key
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
      access                     = security_rule.value.access
      protocol                   = security_rule.value.protocol
      source_port_range          = security_rule.value.source_range
      destination_port_range     = security_rule.value.dest_range
      source_address_prefix      = security_rule.value.address_prefixes
      destination_address_prefix = security_rule.value.dest_prefixes
    }
  }
}

data "azurerm_network_interface" "data_nic" {
  name                = var.network_interface_name
  resource_group_name = var.resource_group_name
}


resource "azurerm_network_interface_security_group_association" "nicnsg" {
  network_interface_id      = data.azurerm_network_interface.data_nic.id
  network_security_group_id = azurerm_network_security_group.network_security_group.id
}


