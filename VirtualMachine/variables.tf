variable "name" {
  default = "Learning"
}

variable "node" {
  default = "node1"
}

variable "vm_size" {
  default = "Standard_D2s_v3"
}

variable "publisher" {
  default = "Canonical"
}

variable "offer" {
  default = "UbuntuServer"
}

variable "sku" {
  default = "18.04-LTS"
}

variable "disk_size_gb" {
  default = "100"
}

variable "managed_disk_type" {
  default = "Standard_LRS"
}

variable "admin_username" {
  default = "manu"
}
