module "resource_group" {
  source   = "../Modules/ResourceGroup"
  name     = "${var.name}"
  location = "${var.location}"
}
