output "dcID" {
    value = "${data.vsphere_datacenter.dc.id}"
}

output "rpID" {
    value = "${data.vsphere_compute_cluster.cluster.resource_pool_id}"
}

output "datastoreID" {
    value = "${data.vsphere_datastore.datastore.id}"
}

output "vmFolderID" {
    value = "${vsphere_folder.tfFolder.id}"
}