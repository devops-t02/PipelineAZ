
terraform {

  required_providers {

    azurerm = {

      source = "hashicorp/azurerm"

      version = ">=2.0"

    }
  }

  #terraform cloud  

  backend "remote" {

    organization = "zmware"




    workspaces {

      name = "PipelineAZ"

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
  name                = "myfirstacrazpipeline"
  resource_group_name = "PipelineAZ"
  location            = "eastus"
  sku                 = "Premium"
  admin_enabled       = false

}
