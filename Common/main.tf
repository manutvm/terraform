resource "azurerm_resource_group" "resource_group" {
  name     = "ResourceGroup${var.name}"
  location = "${var.location}"

  tags = {
    environment = "${var.name}"
  }
}
