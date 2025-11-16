output "vnet_id" {
  description = "The ID of the virtual network"
  value       = azurerm_virtual_network.virtual_network.id
}

output "vnet_name" {
  description = "The name of the virtual network"
  value       = azurerm_virtual_network.virtual_network.name
}

output "subnet_names" {
  description = "Names of all subnets in the virtual network"
  value       = [
    for s in azurerm_virtual_network.virtual_network.subnet : s.name
  ]
}

output "subnet_ids" {
  description = "IDs of all subnets created in the virtual network"
  value = [
    for s in azurerm_virtual_network.virtual_network.subnet : s.id
  ]
}