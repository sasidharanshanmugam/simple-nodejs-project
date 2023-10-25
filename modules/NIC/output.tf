# output "network_interface_ids" {
#   value = azurerm_network_interface.example[count.index].id
# }
# output "private_ip_address" {
#   value = azurerm_network_interface.example.private_ip_address
# }
# output "network_interface_ids" {
#   value = [for i in azurerm_network_interface.example : i.id]
# }
# output "network_interface_ids" {
#   value = join(", ", azurerm_network_interface.example[*].id)
# }
output "network_interface_ids" {
  value = azurerm_network_interface.example[*].id
}
