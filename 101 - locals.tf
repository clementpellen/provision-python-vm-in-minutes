##################################################################################
# LOCALS
##################################################################################

locals {
  common_tags = {
    project = var.project_name
  }
  name_suffix = lower("${var.project_name}-${var.azure_region}")
}
