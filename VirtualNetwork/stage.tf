variable "name" {
  default = "Learning"
}

variable "location" {
  default = "South India"
}

variable "address_space" {
  default = "170.0.0.0/16"
}

variable "vnet_address_space" {
  default = "170.0.1.0/24"
}

terraform {
  backend "azurerm" {
    storage_account_name = "terraformstatelearning"
    container_name       = "terraformstate"
    key                  = "learning.terraform.state"
  }
}
