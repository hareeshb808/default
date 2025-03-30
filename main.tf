terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=4.0.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "statefileSA_rg"  
    storage_account_name = "satfstatefilehareesh"                      
    container_name       = "tfstate"                       
    key                  = "gitstate.tfstate"
    access_key          = ${{ secrets.AZ_SA_ACCESS_KEY }}        
  }
}
}

provider "azurerm" {
  alias                      = "management"
  subscription_id            = ${{ secrets.AZ_SUB_ID }}
  skip_provider_registration = true
  features {}
}

resource "azurerm_resource_group" "rg" {
  location = var.resource_group_location
  name     = random_pet.rg_name.id
}

