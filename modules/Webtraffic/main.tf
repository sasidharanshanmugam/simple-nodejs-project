resource "azurerm_traffic_manager_profile" "traffic_manager_profile" {
  name                   = var.trafficmanagername
  resource_group_name    = var.resource_group_name
  traffic_routing_method = "Weighted"
  dns_config {
    relative_name = var.trafficmanagername
    ttl           = 100
  }
  monitor_config {
    protocol                     = "HTTP"
    port                         = 80
    path                         = "/"
    interval_in_seconds          = 30
    timeout_in_seconds           = 9
    tolerated_number_of_failures = 3
  }
}

resource "azurerm_traffic_manager_azure_endpoint" "tm_endpoint" {
  name               = var.trafficmanagername
  profile_id         = azurerm_traffic_manager_profile.traffic_manager_profile.id
  weight             = 100
  target_resource_id = var.public_ip_id
}