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

resource "azurerm_api_management" "apim_example" {
  name                = "demoapim-instance"
  resource_group_name = "my_rg"
  location            = "East US"
  sku_name            = "Basic_1"               # Adjust this based on your APIM SKU
  publisher_name      = "anvith.rai"
  publisher_email     = "anvith.rai@sonata-software.com"
  
  identity {
    type = "SystemAssigned"                        # Example for system-assigned managed identity
  }

  tags = {
    Environment = "Production"
    Department  = "API"
  }
}
