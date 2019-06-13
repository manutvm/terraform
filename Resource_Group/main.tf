module "resource_group" {
  source   = "../Common"
  name     = "${var.name}"
  location = "${var.location}"
}
