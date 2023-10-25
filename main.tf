module "resourcegroup" {
  source = "./modules/resourcegroup"
  resource_group_name = "Devops12"
}
module "vnnet" {
  source = "./modules/Vnet"
  vnetname =  "azdemovnet"
  location            = "East US" 
  resource_group_name = module.resourcegroup.resourcegroupname
  vnet_address_space = ["10.0.0.0/16"]
  subnets = {
    "gateway_subnet"=0
    "default_subnet"=1
    "db_subnet"=2
  }
}
module "nic" {
  source = "./modules/NIC"
  # puplicip  = "azpupiptask"
  # nicname                = "aztasknic"
  location               = "East US"
  resource_group_name = module.resourcegroup.resourcegroupname
  subnetid =  module.vnnet.subnet_ids["default_subnet"]
}
module "vm" {
  source = "./modules/VM"
  network_interface_ids = module.nic.network_interface_ids
  resource_group_name = module.resourcegroup.resourcegroupname
}
module "nsg" {
  source = "./modules/NSG"
  resource_group_name = module.resourcegroup.resourcegroupname
  subnet_id = module.vnnet.subnet_ids["default_subnet"]
  network_interface_id = module.nic.network_interface_ids
}
module "sqlserver" {
  source = "./modules/Azure-SQL-Server"
  SQLservername                = "sagesqlserver1998"
  resource_group_name          = module.resourcegroup.resourcegroupname
  location                     = "East US"
  sqlserverversion             = "12.0"
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
  minimum_tls_version          = "1.2"
  environment                  = "Training"
  enable_azuread_administrator = false
  # subnet2id = module.vnnet.subnet_ids[db_subnet]
  subnet2id = module.vnnet.subnet_ids["db_subnet"]
}
module "sqldb" { 
  source = "./modules/Azure-SQL-DB"
  sqlservername  = "sage-db23"
  sqlserver_id   = module.sqlserver.sagesqlserverid
  license_type   = "BasePrice"
  max_size_gb    = "1"
  read_scale     = false
  sku_name       = "Basic"
  zone_redundant = false
  environment = "Training"
}
module "public_ip_address" {
  source = "./modules/puplicip"
  puplicipname = "lbpupip"
  resource_group_name = module.resourcegroup.resourcegroupname
  location = "East US"
}
module "load_balancer" {
  source = "./modules/Loadbalancer"
  load_balancer_name = "azvmtasklb"
  public_ip_address_id = module.public_ip_address.lbip
  location = "East US"
  resource_group_name = module.resourcegroup.resourcegroupname
  network_interface_id = module.nic.network_interface_ids
}
module "web_traffic" {
 source = "./modules/Webtraffic"  
 trafficmanagername = "aztaskwebtraffic"
 resource_group_name = module.resourcegroup.resourcegroupname
 public_ip_id = module.public_ip_address.lbip
}