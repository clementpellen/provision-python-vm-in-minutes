##################################################################################
# VARIABLES
##################################################################################

variable "location" {
  type        = string
  description = "Region for azure resources"
  default     = "North Europe"
}

variable "azure_region" {
  type        = string
  description = "The Azure region to deploy"
  default     = "neu"
}

variable "project_name" {
  type        = string
  description = "Name of the project"
  default     = "provision-python-vm-in-minutes"
}

variable "vnet_address_space" {
  type        = string
  description = "Address space for the virtual network"
  default     = "10.0.0.0/16"
}
