##################################################################################
# LOCALS
##################################################################################

locals {
  common_tags = {
    project = var.project_name
  }
  name_suffix = lower("${var.project_name}-${var.azure_region}")
}

data "external" "vm_size_data" {
  program = ["bash", "./read_vm_size.sh"]
}

locals {
  file_vm_size    = data.external.vm_size_data.result["vm_size"]
  default_vm_size = "Standard_B1s"
}
