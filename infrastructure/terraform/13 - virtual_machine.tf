##################################################################################
# VIRTUAL MACHINE
##################################################################################

resource "azurerm_linux_virtual_machine" "vm" {
  name                = "vm-${local.name_suffix}"
  resource_group_name = azurerm_resource_group.rg_vm.name
  location            = azurerm_resource_group.rg_vm.location
  size                = coalesce(local.file_vm_size, local.default_vm_size)

  admin_username = "adminuser"

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/ssh-provision-python-vm-in-minutes.pub")
  }

  network_interface_ids = [
    azurerm_network_interface.nic_snet_vm.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
}
