module "network_security_group" {
  source             = "../Modules/NetworkSecurityGroup"
  name               = "${var.name}"
  private_ip_address = "${var.private_ip_address}"
}
