variable "SQLservername" {
  type = string
  default = "sagesqlserver"
}
variable "resource_group_name" {
  type = string
  default = "presapdtrngrg"
}
variable "location" {
  type = string
  default = "East US"
}
variable "sqlserverversion" {
  type = string
  default = "12.0"
}
variable "administrator_login" {
  type = string
  default = "sagesoftware"
}
variable "administrator_login_password" {
  type = string
  default = "Welcome2Linux!"
}
variable "minimum_tls_version" {
  type = number
  default = 1.2
}
variable "environment" {
  type = string
  default = "development"
}
variable "enable_azuread_administrator" {
  type    = bool
  default = false
}
variable "priviteendpointname" {
  type = string
  default = "PVTendpofSQL"
}
variable "subnet2id" {
  type = string
}