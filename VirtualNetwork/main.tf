resource "azurerm_resource_group" "LearningAzureVnet" {
  name     = "LearningAzureVnet"
  location = "South India"

  tags = {
    environment = "Learning"
  }
}

resource "azurerm_virtual_network" "LearningAzureVnet" {
  name                = "LearningAzureVnet"
  location            = "${azurerm_resource_group.LearningAzureVnet.location}"
  resource_group_name = "${azurerm_resource_group.LearningAzureVnet.name}"
  address_space       = ["170.0.0.0/16"]

  tags = {
    environment = "Learning"
  }
}

resource "azurerm_subnet" "LearningAzureVnetSub" {
  name                 = "LearningAzureVnetSub"
  virtual_network_name = "${azurerm_virtual_network.LearningAzureVnet.name}"
  resource_group_name  = "${azurerm_virtual_network.LearningAzureVnet.resource_group_name}"
  address_prefix       = "170.0.1.0/24"
}
