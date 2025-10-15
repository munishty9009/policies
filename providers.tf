terraform {
  backend "azurerm" {
    resource_group_name   = "MyFirstRGfromTerraform"
    storage_account_name  = "mystorageaccount1990"
    container_name        = "state-files"
    key                   = "ApplyPolicies"
  }
}


terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.90.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = ">= 2.30.0"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "azuread" {}
