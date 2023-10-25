resource "azurerm_network_security_group" "example" {
  name                = var.nsgname
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
   security_rule {
    name                       = "ssh"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "port8080"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "8080"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  tags = {
    environment = "Training"
  }
}

# resource "azurerm_subnet_network_security_group_association" "example" {
#   subnet_id                 = var.subnet_id
#   network_security_group_id = azurerm_network_security_group.example.id
# }
# resource "azurerm_network_interface_security_group_association" "example" {
#   network_interface_id      = var.network_interface_id[count.index]
#   network_security_group_id = azurerm_network_security_group.example.id
# }
resource "azurerm_network_interface_security_group_association" "example" {
  count = length(var.network_interface_id)
  network_interface_id = var.network_interface_id[count.index]
  network_security_group_id = azurerm_network_security_group.example.id
}