terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.52.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "home1239"
    storage_account_name = "homestg1239"
    container_name       = "hello"
    key                  = "new.terraform.tfstate"
  }

}

provider "azurerm" {
  features {}
  subscription_id = "580eec40-34b7-4c9b-ba06-bd14c2347042"
}
