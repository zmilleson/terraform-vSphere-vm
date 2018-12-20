## This module determines proper placement within the compute and storage infrastructure.

## Define Variables
variable "dcLocation" {}

variable "datacenter" {
    type    = "map"
    default = {
        Omaha   = "Omaha"
        Chicago = "Omaha"
    }
    description = "Requester enters data center location and maps to the data center name within vCenter."
}

variable "clusters" {
    type    = "map"
    default = {
        Omaha   = "Physical"
        Chicago = "Physical"
    }
    description = "Based on the data center location selected, the appropriate cluster will be returned."
}

variable "datastores" {
    type    = "map"
    default = {
        Physical    = "Silver"
        Production  = "Gold"
    }
}

## Gather compute data from requester's selection
data "vsphere_datacenter" "dc" {
    name = "${lookup(var.datacenter, var.dcLocation)}"
}

data "vsphere_compute_cluster" "cluster" {
    name            = "${lookup(var.clusters,var.dcLocation)}"
    datacenter_id   = "${data.vsphere_datacenter.dc.id}"
}

## Set and gather data from datatore placing.
data "vsphere_datastore" "datastore" {
    name            = "${lookup(var.datastores,data.vsphere_compute_cluster.cluster.name)}"
    datacenter_id   = "${data.vsphere_datacenter.dc.id}"
}