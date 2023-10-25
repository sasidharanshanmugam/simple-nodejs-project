variable "resource_group_name" {
 type = string
 default = "example-resources-14"
}
variable "location" {
  type = string
  default = "East US"
}
variable "vnetname" {
  type = string
  default = "trainingvnet"
}
# variable "subnet1" {
#   type = string
#   default = "pubsub1"
# }
# variable "subnet2" {
#   type = string
#   default = "pubsub2"
# }
# variable "subnet3" {
#   type = string
#   default = "prisub1"
# }
# variable "subnet4" {
#   type = string
#   default = "prisub2"
# }

variable "subnets" {
  description = "contains the subnet name : address-namespace in a map"
  type = map(string)
}
variable "vnet_address_space" {
  description = "address-space of the virtual network"
  type = list(string)
}
