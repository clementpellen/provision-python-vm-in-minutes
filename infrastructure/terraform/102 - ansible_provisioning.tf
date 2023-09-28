resource "null_resource" "ansible_provisioning" {
  triggers = {
    cluster_instance_ids = join(",", azurerm_linux_virtual_machine.vm.*.id)
  }

  provisioner "local-exec" {
    command = "cd ../ansible && ./run_ansible_playbook.sh '${azurerm_linux_virtual_machine.vm.public_ip_address}'"
  }
}
