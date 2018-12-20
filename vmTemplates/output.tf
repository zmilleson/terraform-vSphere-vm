output "templateUUID" {
    value = "${data.vsphere_virtual_machine.template.id}"
}

output "netInterfaceTypes" {
    value = "${data.vsphere_virtual_machine.template.network_interface_types[0]}"
}

output "guestID" {
    value = "${data.vsphere_virtual_machine.template.guest_id}"
}

output "scsiType" {
    value = "${data.vsphere_virtual_machine.template.scsi_type}"
}

output "diskSize" {
    value = "${data.vsphere_virtual_machine.template.disks.0.size}"
}

output "thinProv" {
    value = "${data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
}