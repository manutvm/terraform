variable name {
  default = "Learning"
}

variable private_ip_address {
  default = "170.0.1.9"
}

terraform {
  backend "azurerm" {
    storage_account_name = "terraformstatelearning"
    container_name       = "terraformstate"
    key                  = "learning.terraform.state"
  }
}
