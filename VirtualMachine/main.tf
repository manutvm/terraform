module "virtual_machine_master" {
  source             = "../Modules/VirtualMachine"
  name               = "${var.name}"
  node               = "master"
  vm_size            = "${var.vm_size}"
  publisher          = "${var.publisher}"
  offer              = "${var.offer}"
  sku                = "${var.sku}"
  disk_size_gb       = "${var.disk_size_gb}"
  managed_disk_type  = "${var.managed_disk_type}"
  admin_username     = "${var.admin_username}"
  key_data           = "${file("id_rsa.pub")}"
  private_ip_address = "170.0.1.11"
}

module "virtual_machine_slave" {
  source             = "../Modules/VirtualMachine"
  name               = "${var.name}"
  node               = "slave"
  vm_size            = "${var.vm_size}"
  publisher          = "${var.publisher}"
  offer              = "${var.offer}"
  sku                = "${var.sku}"
  disk_size_gb       = "${var.disk_size_gb}"
  managed_disk_type  = "${var.managed_disk_type}"
  admin_username     = "${var.admin_username}"
  key_data           = "${file("id_rsa.pub")}"
  private_ip_address = "170.0.1.12"
}
