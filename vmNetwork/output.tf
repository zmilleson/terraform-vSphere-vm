output "vNetId" {
    value = "${data.vsphere_network.net.id}"
}

output "domain" {
    value = "${var.domain}"
}

/*output "gateway" {
    value = "${var.gateway}"
}

output "netmask" {
    value = "${var.netmask}"
}*/