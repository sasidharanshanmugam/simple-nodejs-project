variable "nicname" {
  type = list(string)
  default = ["vmnicekls","vm2nic"]
}
variable "location" {
  type = string
  default = "West Europe "
}
variable "resource_group_name" {
  type = string
  default = "example-resources-14"
}
variable "subnetid" {
  type= string
}
variable "puplicip" {
 type = list(string)
 default = ["pupipts1", "pupipts2"] 
}