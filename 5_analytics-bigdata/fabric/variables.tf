variable "resource_group_name" {
  description = "The name of the Azure Resource Group to deploy into. This template will create the RG if it does not exist (idempotent ARM PUT)."
  type        = string

  validation {
    condition     = length(trimspace(var.resource_group_name)) > 0
    error_message = "resource_group_name must not be empty."
  }
}

variable "location" {
  description = "The Azure region where the Resource Group and Fabric capacity will be created."
  type        = string

  validation {
    condition     = length(trimspace(var.location)) > 0
    error_message = "location must not be empty."
  }
}

variable "append_random_suffix" {
  description = "Whether to append a random suffix to the capacity name to avoid collisions."
  type        = bool
  default     = true
}

variable "random_suffix_length" {
  description = "Length of the random suffix appended when append_random_suffix is true."
  type        = number
  default     = 6

  validation {
    condition     = var.random_suffix_length >= 4 && var.random_suffix_length <= 16
    error_message = "random_suffix_length must be between 4 and 16."
  }
}

variable "capacity_name" {
  description = "Base name of the Fabric capacity. If append_random_suffix is true, the final name will be '<base>-<suffix>'."
  type        = string

  validation {
    condition = (
      length(trimspace(var.capacity_name)) > 0
      && length(var.capacity_name) <= (var.append_random_suffix ? (63 - 1 - var.random_suffix_length) : 63)
      && length(join("", regexall("[a-z0-9]", lower(var.capacity_name)))) > 0
    )
    error_message = "capacity_name must be 1-63 chars and must contain at least one letter or digit (Terraform will sanitize the name to meet Azure resource naming constraints)."
  }
}

variable "admin_members" {
  description = "Optional list of Fabric capacity admin members (UPNs). If empty and use_current_user_as_admin is true, Terraform will resolve the current user and use that UPN."
  type        = list(string)
  default     = []
}

variable "use_current_user_as_admin" {
  description = "When true and admin_members is empty, resolve the currently authenticated Entra ID user and set them as the Fabric capacity admin. Requires AzureAD (Microsoft Graph) read permissions to resolve the UPN."
  type        = bool
  default     = true
}

variable "sku_name" {
  description = "SKU name for the Fabric capacity (for example: F2, F4, F8, F16, F32, F64, F128, F256, F512, F1024, F2048)."
  type        = string
  default     = "F2"
}

variable "sku_tier" {
  description = "SKU tier for the Fabric capacity."
  type        = string
  default     = "Fabric"
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default     = {}
}
