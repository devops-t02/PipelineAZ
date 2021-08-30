terraform {

  required_providers {

    azurerm = {

      source = "hashicorp/azurerm"

      version = ">=2.0"

    }
  }

  #terraform cloud  

  backend "remote" {

    organization = "cloud-demos"




    workspaces {

      name = "az-pipeline1"

    }
  }
}

# Configure the Microsoft Azure Provider 

provider "azurerm" {
  skip_provider_registration = "true"
  features {}
}

#create azure container registry  

resource "azurerm_container_registry" "acr" {
  name                = "myfirstacrazpipeline4"
  resource_group_name = "az-pipeline2"
  location            = "eastus"
  sku                 = "Premium"
  admin_enabled       = false

}
