variable "environment" {
  description = "environment name"
}

variable "resource_group_name" {
  description = "The name of an existing resource group to be imported."
  type        = string
}

variable "resource_group_location" {
  type = string
  description = "(optional) describe your variable"
}

variable "object_id" {
  type        = string
  description = "(optional) describe your variable"
}

variable "tenant_id" {
  type        = string
  description = "(optional) describe your variable"
}

variable "sku_name" {
  type = string
  description = "The Name of the SKU used for this Key Vault. Possible values are `standard` and `premium`."
  default     = "standard"
}

variable "enabled_for_deployment" {
  description = "Boolean flag to specify whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the key vault. Defaults to `false`."
  type        = bool
  default     = false
}

variable "enabled_for_disk_encryption" {
  description = "Boolean flag to specify whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys. Defaults to `false`."
  type        = bool
  default     = false
}

variable "enabled_for_template_deployment" {
  description = "Boolean flag to specify whether Azure Resource Manager is permitted to retrieve secrets from the key vault. Defaults to `false`."
  type        = bool
  default     = false
}

variable "soft_delete_retention_days" {
  description = "The number of days that items should be retained for once soft-deleted."
  type        = number
  default     = 7
}

variable "purge_protection_enabled" {
  type = bool
  description = "(optional) describe your variable"
}