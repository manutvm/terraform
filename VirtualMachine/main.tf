module "virtual_machine" {
  source            = "../Modules/VirtualMachine"
  name              = "${var.name}"
  node              = "${var.node}"
  vm_size           = "${var.vm_size}"
  publisher         = "${var.publisher}"
  offer             = "${var.offer}"
  sku               = "${var.sku}"
  disk_size_gb      = "${var.disk_size_gb}"
  managed_disk_type = "${var.managed_disk_type}"
  admin_username    = "${var.admin_username}"
  key_data          = "${file("id_rsa.pub")}"
}
