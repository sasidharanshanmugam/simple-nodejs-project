terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
#   backend "azurerm" {
#       resource_group_name  = "Devopstraining123"
#       storage_account_name = "aztaskstorageaccount1"
#       container_name       = "statefile"
#        key = "terraform.tfstate"
#   }
# }
}
provider "azurerm" {
  features {}
}
