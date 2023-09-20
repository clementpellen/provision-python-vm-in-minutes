##################################################################################
# NETWORK
##################################################################################

resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-${local.name_suffix}"
  location            = azurerm_resource_group.rg_network.location
  resource_group_name = azurerm_resource_group.rg_network.name
  address_space       = [var.vnet_address_space]
  dns_servers         = [cidrhost(var.vnet_address_space, 4), cidrhost(var.vnet_address_space, 5)]

  tags = local.common_tags
}

resource "azurerm_subnet" "snet_vm" {
  name                 = "snet-vm-${local.name_suffix}"
  resource_group_name  = azurerm_resource_group.rg_network.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [cidrsubnet(var.vnet_address_space, 8, 1)]
}

resource "azurerm_network_interface" "nic_snet_vm" {
  name                = "nic-snet-vm-${local.name_suffix}"
  location            = azurerm_resource_group.rg_network.location
  resource_group_name = azurerm_resource_group.rg_network.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.snet_vm.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip_nic.id
  }

  tags = local.common_tags
}

resource "azurerm_public_ip" "pip_nic" {
  name                = "pip-nic-${local.name_suffix}"
  resource_group_name = azurerm_resource_group.rg_network.name
  location            = azurerm_resource_group.rg_network.location
  allocation_method   = "Dynamic"

  # Avoid an error when nic is deleted
  lifecycle {
    create_before_destroy = true
  }

  tags = local.common_tags
}

