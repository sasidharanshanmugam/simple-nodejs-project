
# resource "azurerm_virtual_machine" "main" {
#   name                  = "ubuntuvm1234"
#   location              = var.location
#   # custom_data = base64encode(file("init.sh"))
#   resource_group_name   = var.resource_group_name
#   network_interface_ids = var.network_interface_ids
#   vm_size               = "Standard_DS1_v2"
  

#   storage_image_reference {
#     publisher = "Canonical"
#     offer     = "0001-com-ubuntu-server-focal"
#     sku       = "20_04-lts"
#     version   = "latest"
#   }
#   storage_os_disk {
#     name              = "myosdisk123"
#     caching           = "ReadWrite"
#     create_option     = "FromImage"
#     managed_disk_type = "Standard_LRS"
#   }
#   os_profile {
#     computer_name  = "hostname"
#     admin_username = "sasidharan"
#     admin_password = "Sasidharan*1998"
#   }
#   os_profile_linux_config {
#     disable_password_authentication = false
#   }
#   tags = {
#     environment = "training"
#   }
# }
# # resource "azurerm_virtual_machine_extension" "example" {
# #   name                 = var.Extensionname
# #   virtual_machine_id   = azurerm_virtual_machine.main.id
# #   publisher            = "Microsoft.Azure.Extensions"
# #   type                 = "CustomScript"
# #   type_handler_version = "2.1"

# #   settings = jsonencode({
# #     "commandToExecute" = "sudo apt update  && sudo apt install -y nginx"
# #   })

# #   tags = {
# #     environment = "training"
# #   }
# # }
#---
# resource "azurerm_linux_virtual_machine" "webserver" {
#   # count                           = 2
#   name                            = var.vmname
#   resource_group_name             = var.resource_group_name
#   location                        = var.location
#   size                            = "Standard_DS1_v2"
#   admin_username                  = var.admin_username
#   admin_password                  = var.admin_password
#   disable_password_authentication = false
#   network_interface_ids           = var.network_interface_ids
#   os_disk {
#     caching              = "ReadWrite"
#     storage_account_type = "Premium_LRS"
#   }

#   source_image_reference {
#     publisher = "Canonical"
#     offer     = "UbuntuServer"
#     sku       = "18.04-LTS"
#     version   = "latest"
#   }

# #   
# custom_data = base64encode(
#     <<-EOF
#     #!/bin/bash
#     sudo apt-get update
#     sudo apt-get install -y apache2
#     sudo systemctl enable apache2
#     sudo systemctl start apache2
#     EOF
#   )

#   provisioner "remote-exec" {
#     inline = [
#       "sudo apt-get update",
#       "sudo apt-get install -y apache2",
#       "sudo systemctl enable apache2",
#       "sudo systemctl start apache2"
#     ]
#   }
# }
#-------
#create Linux VM
# resource "azurerm_linux_virtual_machine" "nginx" {
#   size                  = "Standard_DS1_v2"
#   name                  = "chisomjude-nginx-webserver"
#   resource_group_name   = var.resource_group_name
#   location              = var.location
#   network_interface_ids = var.network_interface_ids

#   source_image_reference {
#     publisher = "Canonical"
#     offer     = "UbuntuServer"
#     sku       = "18.04-LTS"
#     version   = "latest"
#   }

#   computer_name = "nginx"
#   admin_username = var.admin_username
#   admin_password = var.admin_password
#   disable_password_authentication = false

#   os_disk {
#     name              = "nginxdisk23"
#     caching           = "ReadWrite"
#     storage_account_type = "Standard_LRS"
#   }

#   tags = {
#     environment = "training"
#     costcenter  = "Dev"
#   }
# }



# resource "null_resource" "install_nginx" {
#   depends_on = [azurerm_linux_virtual_machine.nginx]

#   provisioner "Remote-exec" {
#     command = "sshpass -p '${var.admin_password}' ssh ${var.admin_username}@${azurerm_linux_virtual_machine.nginx.public_ip_address} 'sudo apt-get update && sudo apt-get install -y nginx'"
#   }
# }
resource "azurerm_linux_virtual_machine" "webserver" {
  count = 2
  name                            = var.vmname [count.index]
  resource_group_name             = var.resource_group_name
  location                        = var.location
  size                            =  "Standard_DS1_v2"
  admin_username                  = var.admin_username
  admin_password                  = var.admin_password
  disable_password_authentication = false
  availability_set_id             = azurerm_availability_set.avset.id
  network_interface_ids           = [var.network_interface_ids [count.index]]
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
    # timeout = 1h
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  computer_name = "myVM-${count.index}"
  custom_data = base64encode(<<-EOF
  #!/bin/bash
  echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf > /dev/null
  sudo apt-get update 
  sudo apt-get install -y nginx
  sudo systemctl start nginx
  sudo systemctl enable nginx
  echo "Welcome to Server ${count.index}"
EOF
)
}
resource "azurerm_availability_set" "avset" {
  location                     = var.location
  name                         = "avset"
  resource_group_name          = var.resource_group_name
  platform_fault_domain_count  = 2
  platform_update_domain_count = 2
  managed                      = true
}