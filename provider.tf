terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.50.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "jk_rg"
    storage_account_name = "jkstorageacc"
    container_name       = "jkcontainer"
    key                  = "action.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "0dbc7906-293b-41aa-916d-9f62c7c48126"
}
