data "azurerm_resource_group" "resource_group" {
  name = "ResourceGroup${var.name}"
}

data "azurerm_subnet" "vsubnet" {
  name                 = "${var.name}AzureVnetSub"
  virtual_network_name = "${var.name}AzureVnet"
  resource_group_name  = "${data.azurerm_resource_group.resource_group.name}"
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

resource "azurerm_public_ip" "public_ip" {
  name                         = "PublicIP${var.name}"
  location                     = "${data.azurerm_resource_group.resource_group.location}"
  resource_group_name          = "${data.azurerm_resource_group.resource_group.name}"
  public_ip_address_allocation = "Static"

  tags {
    environment = "${var.name}"
  }
}

resource "azurerm_network_interface" "networkinterface" {
  name                      = "${var.name}-NIC"
  location                  = "${data.azurerm_resource_group.resource_group.location}"
  resource_group_name       = "${data.azurerm_resource_group.resource_group.name}"
  network_security_group_id = "${azurerm_network_security_group.networksg.id}"

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = "${data.azurerm_subnet.vsubnet.id}"
    private_ip_address            = "${var.private_ip_address}"
    private_ip_address_allocation = "Static"
    public_ip_address_id          = "${azurerm_public_ip.public_ip.id}"
  }

  tags {
    environment = "${var.name}"
  }
}
