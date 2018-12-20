variable "vsphere_user" {
    description = "A vSphere Admin user."
}
variable "vsphere_pass" {
    description = "The related password for the admin user."  
}
variable "vcenter" {
    description = "The vCenter server FQDN."
}

variable "serverPrefix" {
    default = "tfTest"
}

variable "count" {
    description = "How many VMs need to be deployed?"
}

variable "vmsize" {
    description = "Enter you desired size (xsmall, small, medium, large, xlarge)."
}

/*variable "ipAddress" {
    description = "Enter ip address within the 192.168.1.0/24 network."
}*/

variable "os" {
    description = "Enter an available templated OS (Ubuntu, Centos)."
}

variable "dcLocation" {
    description = "Enter a data center location (Omaha or Chicago)."
}