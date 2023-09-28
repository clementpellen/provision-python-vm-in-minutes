output "vm-ip" {
  value = azurerm_linux_virtual_machine.vm.public_ip_address
}

resource "local_file" "vm-ip" {
  content  = azurerm_linux_virtual_machine.vm.public_ip_address
  filename = "output.txt"
}
