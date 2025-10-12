variable "subscription_id" {
  type        = string
  description = "Azure subscription ID"
}

variable "rg_name" {
  type        = string
  description = "Resource Group name where role will be assigned"
}

variable "sp_object_id" {
  type        = string
  description = "Service Principal Object ID to assign custom role"
}
