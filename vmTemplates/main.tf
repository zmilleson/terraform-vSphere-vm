## This module matches up an entered operating system with a template and its backend information.

## Define Variables
variable "dcID" {}

variable "os" {}

variable "operatingSystem" {
    type    = "map"
    default = {
        Ubuntu        = "Ubuntu 16"
        Centos        = "CentOS-7"
    }
    description = "Takes in generic operating system name and returns the name of the related template."
}

## Discover data from selected template
data "vsphere_virtual_machine" "template" {
    name            = "${lookup(var.operatingSystem,var.os)}"
    datacenter_id   = "${var.dcID}"
}

