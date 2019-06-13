# Resource Group for Terraform resources
resource "azurerm_resource_group" "terraform" {
  name     = "ResourceGroupTerraform"
  location = "South India"

  tags {
    environment = "Global"
  }
}

# Storage account used to store Terraform state
resource "azurerm_storage_account" "terraform" {
  name                     = "terraformstatelearning"
  resource_group_name      = "${azurerm_resource_group.terraform.name}"
  location                 = "${azurerm_resource_group.terraform.location}"
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags {
    environment = "Terraform"
  }
}

# Container in the Storage account for the Terraform state files
resource "azurerm_storage_container" "terraform" {
  name                  = "terraformstate"
  resource_group_name   = "${azurerm_resource_group.terraform.name}"
  storage_account_name  = "${azurerm_storage_account.terraform.name}"
  container_access_type = "private"
}
