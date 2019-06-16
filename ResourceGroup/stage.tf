variable name {
  default = "Learning"
}

variable location {
  default = "South India"
}

terraform {
  backend "azurerm" {
    storage_account_name = "terraformstatelearning"
    container_name       = "terraformstate"
    key                  = "Learning.ResourceGroup.terraform.state"
  }
}
