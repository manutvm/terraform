module "virtual_network" {
  source         = "../Modules/VirtualNetwork"
  name           = "${var.name}"
  location       = "${var.location}"
  address_space  = "${var.address_space}"
  address_prefix = "${var.address_prefix}"
}
