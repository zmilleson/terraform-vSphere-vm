output "vNetId" {
    value = "${data.vsphere_network.net.id}"
}

output "domain" {
    value = "${var.domain}"
}