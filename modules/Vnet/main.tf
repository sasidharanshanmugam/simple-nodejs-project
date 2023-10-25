resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.vnet_address_space
}
resource "azurerm_subnet" "subnet" {
  for_each = var.subnets
  address_prefixes     = [cidrsubnet(var.vnet_address_space[0],8 ,each.value )]
  name                 = each.key
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.example.name
}
# resource "azurerm_virtual_network" "example" {
#   name                = "example-network"
#   location            = var.location
#   resource_group_name = var.resource_group_name
#   address_space       = ["10.0.0.0/16"]
#   # dns_servers         = ["10.0.0.4", "10.0.0.5"
# }

# resource "azurerm_subnet" "example" {
#   name                 = var.subnet1
#   resource_group_name  = var.resource_group_name
#   virtual_network_name = azurerm_virtual_network.example.name
#   address_prefixes     = ["10.0.1.0/24"]
# }
# resource "azurerm_subnet" "subnet2" {
#   name                 = var.subnet2
#   resource_group_name  = var.resource_group_name
#   virtual_network_name = azurerm_virtual_network.example.name
#   address_prefixes     = ["10.0.2.0/24"]
# }
# resource "azurerm_subnet" "subnet3" {
#   name                 = var.subnet3
#   resource_group_name  = var.resource_group_name
#   virtual_network_name = azurerm_virtual_network.example.name
#   address_prefixes     = ["10.0.3.0/24"]
# }
# resource "azurerm_subnet" "subnet4" {
#   name                 = var.subnet4
#   resource_group_name  = var.resource_group_name
#   virtual_network_name = azurerm_virtual_network.example.name
#   address_prefixes     = ["10.0.4.0/24"]
# }

