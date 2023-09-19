##################################################################################
# NETWORK SECURITY GROUP
##################################################################################

resource "azurerm_network_security_group" "nsg_nic" {
  name                = "nsg-nic-${local.name_suffix}"
  location            = azurerm_resource_group.rg_network.location
  resource_group_name = azurerm_resource_group.rg_network.name

  security_rule {
    name                       = "allow_ssh"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = local.common_tags
}

resource "azurerm_network_interface_security_group_association" "nsg_nic" {
  network_interface_id      = azurerm_network_interface.nic_snet_vm.id
  network_security_group_id = azurerm_network_security_group.nsg_nic.id

  # Avoid an error when nic is deleted
  lifecycle {
    create_before_destroy = true
  }
}
