## Define Variables
variable "size" {}
variable "cpus" {
    type = "map"
    default = {
        xsmall  = 1
        small   = 2
        medium  = 4
        large   = 8
        xlarge  = 12
    }
    description = "Number of CPUs to be added to a new server."
}

variable "memory" {
    type = "map"
    default = {
        xsmall  = 512
        small   = 1024
        medium  = 4096
        large   = 8192
        xlarge  = 12288
    }
    description = "Amount of memory to be added to a new server."
}