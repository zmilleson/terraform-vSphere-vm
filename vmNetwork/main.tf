## Variables
variable "dcID" {}
data "vsphere_network" "net" {
    name            = "VM Network"
    datacenter_id   = "${var.dcID}"
}

variable "domain" {
    default = "get-vm.local"
}

/*variable "gateway" {
    default = "192.168.1.1"
}

variable "netmask" {
    default = 24
}*/