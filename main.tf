terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=4.0.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "test-workflow-runner-rg"  
    storage_account_name = "testrunnerworkflow"                      
    container_name       = "tfstate"                       
    key                  = "terraform.tfstate"
    access_key          = ${{ secrets.ACCESSKEY }}        
  }
}
}

provider "azurerm" {
  alias                      = "management"
  subscription_id            = ${{ secrets.subid }}
  skip_provider_registration = true
  features {}
}

resource "azurerm_resource_group" "rg" {
  location = var.resource_group_location
  name     = random_pet.rg_name.id
}

