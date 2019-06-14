data "azurerm_resource_group" "resource_group" {
  name = "ResourceGroup${var.name}"
}

data "azurerm_network_interface" "network_interface" {
  name                = "${var.name}-NIC"
  resource_group_name = "${data.azurerm_resource_group.resource_group.name}"
}

resource "azurerm_virtual_machine" "vm" {
  name                  = "vm${lower(var.name)}${lower(var.node)}"
  resource_group_name   = "${data.azurerm_resource_group.resource_group.name}"
  location              = "${data.azurerm_resource_group.resource_group.location}"
  network_interface_ids = ["${data.azurerm_network_interface.network_interface.id}"]
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
