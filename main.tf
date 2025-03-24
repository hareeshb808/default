terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=4.0.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "NextOps"  
    storage_account_name = "nextopstfsat20"                      
    container_name       = "tfstate"                       
    key                  = "terraform.tfstate"
    access_key          = "jfaksdnkcnidjcijdiankdnkndinikniknikanfidif"        
  }
}
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  location = var.resource_group_location
  name     = random_pet.rg_name.id
}

