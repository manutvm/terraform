module "virtual_network" {
  source             = "../Modules/VirtualNetwork"
  name               = "${var.name}"
  location           = "${var.location}"
  address_space      = "${var.address_space}"
  vnet_address_space = "${var.vnet_address_space}"
}
