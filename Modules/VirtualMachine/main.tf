data "azurerm_resource_group" "resource_group" {
  name = "ResourceGroup${var.name}"
}

data "azurerm_network_security_group" "networksg" {
  name                = "${var.name}NetworkSecurityGroup"
  resource_group_name = "ResourceGroup${var.name}"
}

data "azurerm_subnet" "vsubnet" {
  name                 = "${var.name}AzureVnetSub"
  virtual_network_name = "${var.name}AzureVnet"
  resource_group_name  = "${data.azurerm_resource_group.resource_group.name}"
}

resource "azurerm_public_ip" "public_ip" {
  name                    = "vm${lower(var.name)}${lower(var.node)}-pip"
  location                = "${data.azurerm_resource_group.resource_group.location}"
  resource_group_name     = "${data.azurerm_resource_group.resource_group.name}"
  allocation_method       = "Static"
  idle_timeout_in_minutes = "30"
  domain_name_label       = "vm${lower(var.name)}${lower(var.node)}"
  reverse_fqdn            = "vm${lower(var.name)}${lower(var.node)}.southindia.cloudapp.azure.com"

  tags {
    environment = "${var.name}"
  }
}

resource "azurerm_network_interface" "networkinterface" {
  name                      = "vm${lower(var.name)}${lower(var.node)}-nic"
  location                  = "${data.azurerm_resource_group.resource_group.location}"
  resource_group_name       = "${data.azurerm_resource_group.resource_group.name}"
  network_security_group_id = "${data.azurerm_network_security_group.networksg.id}"

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

resource "azurerm_virtual_machine" "vm" {
  name                  = "vm${lower(var.name)}${lower(var.node)}"
  resource_group_name   = "${data.azurerm_resource_group.resource_group.name}"
  location              = "${data.azurerm_resource_group.resource_group.location}"
  network_interface_ids = ["${azurerm_network_interface.networkinterface.id}"]
  vm_size               = "${var.vm_size}"

  delete_os_disk_on_termination    = false
  delete_data_disks_on_termination = false

  storage_image_reference {
    publisher = "${var.publisher}"
    offer     = "${var.offer}"
    sku       = "${var.sku}"
    version   = "latest"
  }

  storage_os_disk {
    name              = "OSDisk${lower(var.name)}${lower(var.node)}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    disk_size_gb      = "${var.disk_size_gb}"
    managed_disk_type = "${var.managed_disk_type}"
  }

  os_profile {
    computer_name  = "vm${lower(var.name)}${lower(var.node)}"
    admin_username = "${var.admin_username}"
  }

  os_profile_linux_config {
    disable_password_authentication = true

    ssh_keys {
      key_data = "${var.key_data}"
      path     = "/home/manu/.ssh/authorized_keys"
    }
  }

  tags = {
    environment = "${var.name}"
  }
}
