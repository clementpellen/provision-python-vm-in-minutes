##################################################################################
# RESOURCE GROUP
##################################################################################

resource "azurerm_resource_group" "rg_network" {
  name     = "rg-network-${local.name_suffix}"
  location = var.location

  tags = local.common_tags
}

resource "azurerm_resource_group" "rg_vm" {
  name     = "rg-vm-${local.name_suffix}"
  location = var.location

  tags = local.common_tags
}
