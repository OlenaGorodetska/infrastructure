variable "resource_group_location" {
  type        = string
  description = "Name of resource location"
}

variable "resource_group_name" {
  type        = string
  description = "Name of resource name"
}

variable "environment" {
  type        = string
  description = "environment name"
}

variable "purge_protection_enabled" {
  type        = bool
  description = "(optional) describe your variable"
}
variable "subscription_id" {
  type        = string
  description = "(optional) describe your variable"
}
variable "client_id" {
  type        = string
  description = "(optional) describe your variable"
}

variable "client_secret" {
  type        = string
  description = "(optional) describe your variable"
}

variable "tenant_id" {
  type        = string
  description = "(optional) describe your variable"
}

variable "object_id" {
  type        = string
  description = "(optional) describe your variable"
}

variable "server_name" {
  type        = string
  description = "(optional) describe your variable"
}

variable "secret_name" {
    type        = string
  description = "(optional) describe your variable"
}
variable "secret_value" {
  type        = string
  description = "(optional) describe your variable"
}

variable "administrator_login" {
  type        = string
  description = "(optional) describe your variable"
}

variable "sku_name" {
  type        = string
  description = "(optional) describe your variable"
}

variable "server_version" {
  type        = string
  description = "(optional) describe your variable"
  
}
