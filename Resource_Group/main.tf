resource "azurerm_resource_group" "test" {
  name     = "testResourceGroup1"
  location = "South India"

  tags = {
    environment = "Production"
  }
}

terraform {
  backend "azurerm" {
    storage_account_name = "terraformstatelearning"
    container_name       = "terraformstate"
    key                  = "Resource_Group.terraform.state"
  }
}

