provider "vsphere" {
    user                    = "${var.vsphere_user}"
    password                = "${var.vsphere_pass}"
    vsphere_server          = "${var.vcenter}"
    allow_unverified_ssl    = true
}

## Import module data
module "vmPlacement" {
    source = "./vmPlacement"
    dcLocation = "${title(var.dcLocation)}"
}

module "vmSizes" {
  source    = "./vmSizes"
  size      = "${lower(var.vmsize)}"
}

module "vmNetwork" {
    source  = "./vmNetwork"
    dcID    = "${module.vmPlacement.dcID}"
}

module "vmTemplates" {
    source  = "./vmTemplates"
    dcID    = "${module.vmPlacement.dcID}"
    os      = "${title(var.os)}"
}

## Define required virtual machine resource
resource "vsphere_virtual_machine" "vm" {
    name                = "${var.serverPrefix}-${count.index}"
    resource_pool_id    = "${module.vmPlacement.rpID}"
    datastore_id        = "${module.vmPlacement.datastoreID}"
    count               = "${var.count}"

    num_cpus            = "${module.vmSizes.cpuCount}"
    memory              = "${module.vmSizes.memCount}"
    guest_id            = "${module.vmTemplates.guestID}"

    scsi_type           = "${module.vmTemplates.scsiType}"

    network_interface   {
        network_id      = "${module.vmNetwork.vNetId}"
        adapter_type    = "${module.vmTemplates.netInterfaceTypes}"
    }

    disk {
        label               = "OS"
        size                = "${module.vmTemplates.diskSize}"
        thin_provisioned    = "${module.vmTemplates.thinProv}"
    }
    clone {
        template_uuid   = "${module.vmTemplates.templateUUID}"

        customize {
            linux_options {
                host_name   = "${var.serverPrefix}-${count.index}"
                domain      = "${module.vmNetwork.domain}"
            }
            network_interface {}
        }
    }
}
