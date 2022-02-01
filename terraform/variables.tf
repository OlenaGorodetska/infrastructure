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
    type = bool
    description = "(optional) describe your variable"
}
variable "subscription_id" {
  type        = string
  description = "(optional) describe your variable"
  default     = "a0428382-057e-415e-b01f-0eb0d6b4fbc8"
}
variable "client_id" {
  type        = string
  description = "(optional) describe your variable"
  default     = "8c333c65-ae57-4267-a1df-cccd0ebdac1d"
}

variable "client_secret" {
  type        = string
  description = "(optional) describe your variable"
  # default = "TpR7Q~TTGhI_.6Uk6KvXIOIiWXrrmW.478ZSc"
  default = "3VzETy15-krZL9rw4LY~jTQ5sb5z1h8M~b"
}

variable "tenant_id" {
  type        = string
  description = "(optional) describe your variable"
  default     = "6c51c659-9d52-41af-81f7-dde16380e813"
}

variable "object_id" {
    type        = string
    description = "(optional) describe your variable"
}