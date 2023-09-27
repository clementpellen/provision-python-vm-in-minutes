resource "null_resource" "ansible_provisioning" {
  triggers = {
    cluster_instance_ids = join(",", azurerm_linux_virtual_machine.vm.*.id)
  }

  provisioner "local-exec" {
    command = "cd ../ansible && ansible-playbook -i '${azurerm_linux_virtual_machine.vm.public_ip_address},' -u adminuser --private-key=~/.ssh/ssh-provision-python-vm-in-minutes.pem -e 'ansible_ssh_common_args=\"-o StrictHostKeyChecking=no\"' playbook.yml"
  }
}
