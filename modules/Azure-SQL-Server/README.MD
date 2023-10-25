<<<<<<< HEAD
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_mssql_server.SQLserver](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_server) | resource |
| [azurerm_private_endpoint.db-private-endpoint](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_SQLservername"></a> [SQLservername](#input\_SQLservername) | n/a | `string` | `"sagesqlserver"` | no |
| <a name="input_administrator_login"></a> [administrator\_login](#input\_administrator\_login) | n/a | `string` | `"sagesoftware"` | no |
| <a name="input_administrator_login_password"></a> [administrator\_login\_password](#input\_administrator\_login\_password) | n/a | `string` | `"Welcome2Linux!"` | no |
| <a name="input_enable_azuread_administrator"></a> [enable\_azuread\_administrator](#input\_enable\_azuread\_administrator) | n/a | `bool` | `false` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | `"development"` | no |
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | `"East US"` | no |
| <a name="input_minimum_tls_version"></a> [minimum\_tls\_version](#input\_minimum\_tls\_version) | n/a | `number` | `1.2` | no |
| <a name="input_priviteendpointname"></a> [priviteendpointname](#input\_priviteendpointname) | n/a | `string` | `"PVTendpofSQL"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | n/a | `string` | `"presapdtrngrg"` | no |
| <a name="input_sqlserverversion"></a> [sqlserverversion](#input\_sqlserverversion) | n/a | `string` | `"12.0"` | no |
| <a name="input_subnet2id"></a> [subnet2id](#input\_subnet2id) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sagesqlserverid"></a> [sagesqlserverid](#output\_sagesqlserverid) | n/a |
=======
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_mssql_server.SQLserver](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_server) | resource |
| [azurerm_private_endpoint.db-private-endpoint](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_SQLservername"></a> [SQLservername](#input\_SQLservername) | n/a | `string` | `"sagesqlserver"` | no |
| <a name="input_administrator_login"></a> [administrator\_login](#input\_administrator\_login) | n/a | `string` | `"sagesoftware"` | no |
| <a name="input_administrator_login_password"></a> [administrator\_login\_password](#input\_administrator\_login\_password) | n/a | `string` | `"Welcome2Linux!"` | no |
| <a name="input_enable_azuread_administrator"></a> [enable\_azuread\_administrator](#input\_enable\_azuread\_administrator) | n/a | `bool` | `false` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | `"development"` | no |
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | `"East US"` | no |
| <a name="input_minimum_tls_version"></a> [minimum\_tls\_version](#input\_minimum\_tls\_version) | n/a | `number` | `1.2` | no |
| <a name="input_priviteendpointname"></a> [priviteendpointname](#input\_priviteendpointname) | n/a | `string` | `"PVTendpofSQL"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | n/a | `string` | `"presapdtrngrg"` | no |
| <a name="input_sqlserverversion"></a> [sqlserverversion](#input\_sqlserverversion) | n/a | `string` | `"12.0"` | no |
| <a name="input_subnet2id"></a> [subnet2id](#input\_subnet2id) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sagesqlserverid"></a> [sagesqlserverid](#output\_sagesqlserverid) | n/a |
>>>>>>> 1f28a3a34f47dfd6326a2f214d924c99c128e24a
