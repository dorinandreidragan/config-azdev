terraform {
    required_providers {
      azapi = {
        source  = "azure/azapi"
          version = ">=1.12.1"
      }
      azurerm = {
        source  = "hashicorp/azurerm"
          version = ">=3.97.1"
      }
    }
}

provider "azurerm" {
  features {}
}
