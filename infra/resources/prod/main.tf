# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.50"  # Aggiornato alla versione 3.50 o superiore
    }
  }
}

provider "azurerm" {
  features {}
}

module "commons" {
  source = "../modules/commons"

# parametri... 
  env_short = local.env_short
  prefix = local.prefix
  tags = local.tags
}