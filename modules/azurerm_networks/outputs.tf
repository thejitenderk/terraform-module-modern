output "vnet_id" {
  description = "The ID of the virtual network"
  value       = azurerm_virtual_network.virtual_network.id
}

output "vnet_name" {
  description = "The name of the virtual network"
  value       = azurerm_virtual_network.virtual_network.name
}

# Output the subnet IDs as a map keyed by subnet name
output "subnet_ids" {
  description = "Map of subnet names to their IDs"
  value = {
    for s in azurerm_virtual_network.virtual_network.subnet : s.name => s.id
  }
}

# Optional: Output subnet names as a list
output "subnet_names" {
  description = "List of subnet names in the virtual network"
  value       = [for s in azurerm_virtual_network.virtual_network.subnet : s.name]
}