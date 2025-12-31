terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.52.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "RG-dhgroup39"
    storage_account_name = "devstg3912"
    container_name       = "devcontainer3912"
    key                  = "dev3912key.tfstate"
  }

}



provider "azurerm" {
  features {}
  subscription_id = "a201d6ce-420d-42ed-93d7-34c69de03add"
}