resource "azurerm_public_ip" "example" {
  name                = var.puplicipname
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Static"

  tags = {
    environment = "Training"
  }
}