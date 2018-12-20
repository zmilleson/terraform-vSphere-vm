## Variables
variable "dcID" {}
data "vsphere_network" "net" {
    name            = "VM Network"
    datacenter_id   = "${var.dcID}"
}

variable "domain" {
    default = "get-vm.local"
}