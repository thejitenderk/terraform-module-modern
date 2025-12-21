terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.50.0"
    }
  }
 backend "azurerm" {
  resource_group_name = "neha_rg"
  storage_account_name = "nehasg"
  container_name = "nehacontainer"
  key = "action.terraform.tfstate"
 }
}

provider "azurerm" {
  features {}
}
