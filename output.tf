output "vmIPs" {
    value = "${vsphere_virtual_machine.vm.*.guest_ip_addresses}"
}