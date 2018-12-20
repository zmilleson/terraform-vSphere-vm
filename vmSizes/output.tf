output "cpuCount" {
    value   = "${lookup(var.cpus, var.size)}"
}

output "memCount" {
  value = "${lookup(var.memory, var.size)}"
}
