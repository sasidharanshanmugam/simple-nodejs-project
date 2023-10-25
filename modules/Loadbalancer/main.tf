# Backend address pool
resource "azurerm_lb_backend_address_pool" "backend-pool" {
  loadbalancer_id = azurerm_lb.load-balancer.id
  name            = "pool-1"
}
resource "azurerm_network_interface_backend_address_pool_association" "instances" {
  backend_address_pool_id = azurerm_lb_backend_address_pool.backend-pool.id
  ip_configuration_name   = "pvip"
  network_interface_id    = var.network_interface_id[count.index]
  count                   = length(var.network_interface_id)
}
# Creating of Load Balancer
resource "azurerm_lb" "load-balancer" {
  sku                 = "Basic"
  location            = var.location
  name                = var.load_balancer_name
  resource_group_name = var.resource_group_name
  frontend_ip_configuration {
    name                 = "frontend-config"
    public_ip_address_id = var.public_ip_address_id
  }
}

# creating the load-balancer rule
resource "azurerm_lb_rule" "lb_rules_http" {
  backend_port                   = 80
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.backend-pool.id]
  frontend_ip_configuration_name = "frontend-config"
  frontend_port                  = 80
  loadbalancer_id                = azurerm_lb.load-balancer.id
  name                           = "rule-1"
  protocol                       = "Tcp"
}

# Creating a load-balancer for ssh purpose
resource "azurerm_lb_rule" "lb_rules_ssh" {
  backend_port                   = 22
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.backend-pool.id]
  frontend_ip_configuration_name = "frontend-config"
  frontend_port                  = 22
  loadbalancer_id                = azurerm_lb.load-balancer.id
  name                           = "rule-2"
  protocol                       = "Tcp"
}