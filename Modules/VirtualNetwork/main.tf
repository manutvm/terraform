data "azurerm_resource_group" "resource_group_vnet" {
  name = "ResourceGroup${var.name}"
}

data "azurerm_virtual_network" "vnet" {
  name                = "${var.name}AzureVnet"
  resource_group_name = "${data.azurerm_resource_group.resource_group_vnet.name}"
}

data "azurerm_subnet" "vsubnet" {
  name                 = "${var.name}AzureVnetSub"
  virtual_network_name = "${data.azurerm_virtual_network.vnet.name}"
  resource_group_name  = "${data.azurerm_resource_group.resource_group_vnet.name}"
}

resource "azurerm_resource_group" "resource_group_vnet" {
  name     = "${data.azurerm_resource_group.resource_group_vnet.name}"
  location = "${var.location}"

  tags {
    environment = "${var.name}"
  }
}

resource "azurerm_virtual_network" "vnet" {
  name                = "${data.azurerm_virtual_network.vnet.name}"
  location            = "${data.azurerm_virtual_network.vnet.location}"
  resource_group_name = "${data.azurerm_virtual_network.vnet.resource_group_name}"
  address_space       = "${list(var.address_space)}"

  tags {
    environment = "${var.name}"
  }
}

resource "azurerm_subnet" "vsubnet" {
  name                 = "${data.azurerm_subnet.vsubnet.name}"
  virtual_network_name = "${data.azurerm_subnet.vsubnet.vnet}"
  resource_group_name  = "${data.azurerm_subnet.vsubnet.resource_group_name}"
  address_prefix       = "${var.vnet_address_space}"
}
