variable "load_balancer_name" {
  type = string
  default = "aztasklb"
}
variable "resource_group_name" {
  type = string
  default = "Devopstraining123"
}
variable "location" {
  type = string
  default = "East US"
}
variable "public_ip_address_id" {
    type = string
}
# variable "backend_address_pool_ids" {
#   type = list(string)
# }
variable "network_interface_id" {
  type = list(string)
}