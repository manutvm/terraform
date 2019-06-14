data "azurerm_resource_group" "resource_group_vnet" {
  name = "ResourceGroup${var.name}"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "${var.name}AzureVnet"
  location            = "${var.location}"
  resource_group_name = "${data.azurerm_resource_group.resource_group_vnet.name}"
  address_space       = "${list(var.address_space)}"

  tags {
    environment = "${var.name}"
  }
}

resource "azurerm_subnet" "vsubnet" {
  name                 = "${var.name}AzureVnetSub"
  virtual_network_name = "${azurerm_virtual_network.vnet.name}"
  resource_group_name  = "${data.azurerm_resource_group.resource_group_vnet.name}"
  address_prefix       = "${var.address_prefix}"
}
