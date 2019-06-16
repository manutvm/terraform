module "network_security_group" {
  source             = "../Modules/NetworkSecurityGroup"
  name               = "${var.name}"
}
