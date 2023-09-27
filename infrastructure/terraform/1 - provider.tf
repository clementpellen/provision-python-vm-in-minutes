##################################################################################
# TERRAFORM CONFIG
##################################################################################

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-tfstate-provision-python-vm-in-minutes-neu"
    storage_account_name = "tfstateprovisionvm"
    container_name       = "tfstateprovisionvm"
    key                  = "terraform.tfstate"
  }
}

##################################################################################
# PROVIDERS
##################################################################################

provider "azurerm" {
  features {}
}
