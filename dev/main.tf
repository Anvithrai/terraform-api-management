terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.1.0"  # Specify the version you want to use
    }
  }
}

provider "azurerm" {
  features {}

  # Specify the subscription ID
  subscription_id = "712da521-c439-435c-87a8-402cec7d8d7f"

}

terraform {
  backend "azurerm" {
    resource_group_name   = "terraform-backend-rg"
    storage_account_name  = "terraformstate321"
    container_name        = "tfstate"
    key                   = "dev.terraform.tfstate"
  }
}

resource "azurerm_api_management" "apim_example" {
  name                = "demoapim-instance"
  resource_group_name = "my_rg"
  location            = "East US"
  sku_name            = "Developer_1"               
  publisher_name      = "anvith.rai"
  publisher_email     = "anvith.rai@sonata-software.com"
  
  identity {
    type = "SystemAssigned"                        
  }

  tags = {
    Environment = "Production"
    Department  = "API"
  }
}
