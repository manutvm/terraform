data "azurerm_resource_group" "resource_group" {
  name = "ResourceGroup${var.name}"
}

resource "azurerm_network_security_group" "networksg" {
  name                = "${var.name}NetworkSecurityGroup"
  location            = "${data.azurerm_resource_group.resource_group.location}"
  resource_group_name = "${data.azurerm_resource_group.resource_group.name}"
}

resource "azurerm_network_security_rule" "networksecurityrole" {
  name                        = "${var.name}NetworkSecurityGroup_Port22"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_address_prefix       = "*"
  source_port_range           = "*"
  destination_address_prefix  = "VirtualNetwork"
  destination_port_range      = "22"
  description                 = "Port 22 for SSH Connection"
  network_security_group_name = "${azurerm_network_security_group.networksg.name}"
  resource_group_name         = "${azurerm_network_security_group.networksg.resource_group_name}"
}

resource "azurerm_network_security_rule" "networksecurityrole" {
  name                        = "${var.name}NetworkSecurityGroup_Port6443"
  priority                    = 101
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_address_prefix       = "*"
  source_port_range           = "*"
  destination_address_prefix  = "VirtualNetwork"
  destination_port_range      = "6443"
  description                 = "Port 6443 for Kubernetes Configuration"
  network_security_group_name = "${azurerm_network_security_group.networksg.name}"
  resource_group_name         = "${azurerm_network_security_group.networksg.resource_group_name}"
}