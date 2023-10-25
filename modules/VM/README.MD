<<<<<<< HEAD
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.32.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.32.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_availability_set.avset](https://registry.terraform.io/providers/hashicorp/azurerm/3.32.0/docs/resources/availability_set) | resource |
| [azurerm_linux_virtual_machine.webserver](https://registry.terraform.io/providers/hashicorp/azurerm/3.32.0/docs/resources/linux_virtual_machine) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_password"></a> [admin\_password](#input\_admin\_password) | n/a | `string` | `"Sasidharan*1998"` | no |
| <a name="input_admin_username"></a> [admin\_username](#input\_admin\_username) | variable "Extensionname" { type = string } | `string` | `"sasidharan"` | no |
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | `"East US"` | no |
| <a name="input_network_interface_ids"></a> [network\_interface\_ids](#input\_network\_interface\_ids) | n/a | `list(string)` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | n/a | `string` | `"value"` | no |
| <a name="input_vmname"></a> [vmname](#input\_vmname) | n/a | `list(string)` | <pre>[<br>  "Az-task-vm12",<br>  "AZvmtask34"<br>]</pre> | no |

## Outputs

No outputs.
=======
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.32.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.32.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_linux_virtual_machine.webserver](https://registry.terraform.io/providers/hashicorp/azurerm/3.32.0/docs/resources/linux_virtual_machine) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_Extensionname"></a> [Extensionname](#input\_Extensionname) | n/a | `string` | n/a | yes |
| <a name="input_admin_password"></a> [admin\_password](#input\_admin\_password) | n/a | `string` | `"Sasidharan*1998"` | no |
| <a name="input_admin_username"></a> [admin\_username](#input\_admin\_username) | n/a | `string` | `"sasidharan"` | no |
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | `"East US"` | no |
| <a name="input_network_interface_ids"></a> [network\_interface\_ids](#input\_network\_interface\_ids) | n/a | `list(string)` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | n/a | `string` | `"value"` | no |
| <a name="input_vmname"></a> [vmname](#input\_vmname) | n/a | `string` | `"Az-task-vm"` | no |

## Outputs

No outputs.
>>>>>>> 1f28a3a34f47dfd6326a2f214d924c99c128e24a
