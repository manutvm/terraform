variable name {
  default = "Learning"
}

terraform {
  backend "azurerm" {
    storage_account_name = "terraformstatelearning"
    container_name       = "terraformstate"
    key                  = "Learning.NetworkSecurityGroup.terraform.state"
  }
}
