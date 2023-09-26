resource "null_resource" "ansible_provisioning" {
  triggers = {
    cluster_instance_ids = join(",", azurerm_linux_virtual_machine.vm.*.id)
  }

  provisioner "local-exec" {
    command = "cd ../ansible && ansible-playbook -i '${azurerm_linux_virtual_machine.vm.public_ip_address},' -u adminuser --private-key=~/.ssh/ssh-active-dir-lab-terraform-neu.pem playbook.yml"
  }
}
