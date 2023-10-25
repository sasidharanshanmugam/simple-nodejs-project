variable "nsgname" {
  type = string
  default = "Az-task-vm"
}
variable "location" {
  type = string
  default = "East US"
}
variable "resource_group_name" {
  type = string
  default = "value"
}
variable "subnet_id" {
  type = string
}
variable "network_interface_id" {
  type    = list(string)
}