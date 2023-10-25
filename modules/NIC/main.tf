resource "azurerm_public_ip" "pip" {
  count= 2
  name                = var.puplicip[count.index]
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Dynamic"
}

resource "azurerm_network_interface" "example" {
  count =2
  name                = var.nicname[count.index]
  location            = var.location 
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "pvip"
    subnet_id                     = var.subnetid
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          =  azurerm_public_ip.pip[count.index].id
  }
}
# resource "azurerm_bastion_host" "example" {
#   name                = "examplebastion"
#   location            = azurerm_resource_group.example.location
#   resource_group_name = azurerm_resource_group.example.name

#   ip_configuration {
#     name                 = "configuration"
#     subnet_id            = azurerm_subnet.example.id
#     public_ip_address_id = azurerm_public_ip.example.id
#   }
# }
