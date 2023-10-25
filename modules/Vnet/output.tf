
output "vnetid" {
  value = azurerm_virtual_network.example.id
}
output "subnet_ids" {
  value = {
    for key, subnet in azurerm_subnet.subnet :
    key => subnet.id
  }
}
