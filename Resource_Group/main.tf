resource "azurerm_resource_group" "learning" {
  name     = "LearningAzure"
  location = "South India"

  tags = {
    environment = "Learning"
  }
}

