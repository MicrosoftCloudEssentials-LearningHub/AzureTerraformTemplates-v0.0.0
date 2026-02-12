# variables.tf

variable "resource_group_name" {
  description = "The name of the Azure Resource Group to deploy into. This template will create the RG if it does not exist (idempotent ARM PUT)."
  type        = string

  validation {
    condition     = length(trimspace(var.resource_group_name)) > 0
    error_message = "resource_group_name must not be empty."
  }
}

variable "location" {
  description = "The Azure region where the Resource Group and Databricks workspace will be created."
  type        = string

  validation {
    condition     = length(trimspace(var.location)) > 0
    error_message = "location must not be empty."
  }
}

variable "databricks_workspace_name" {
  description = "Base name of the Azure Databricks workspace. If append_random_suffix is true, the final name will be '<base>-<suffix>'."
  type        = string

  validation {
    condition = (
      length(trimspace(var.databricks_workspace_name)) > 0
      && can(regex("^[a-zA-Z0-9][a-zA-Z0-9-]*$", var.databricks_workspace_name))
    )
    error_message = "databricks_workspace_name must not be empty, start with alphanumeric, and contain only alphanumeric or '-'."
  }
}

variable "sku" {
  description = "Databricks workspace SKU."
  type        = string
  default     = "standard"

  validation {
    condition     = contains(["standard", "premium", "trial"], lower(var.sku))
    error_message = "sku must be one of: standard, premium, trial."
  }
}

variable "managed_resource_group_name" {
  description = "Optional base name of the Databricks managed resource group. If null/omitted, Databricks auto-generates it. If append_random_suffix is true, the final name will be '<base>-<suffix>'."
  type        = string
  default     = null

  validation {
    condition = (
      var.managed_resource_group_name == null ? true : (
        length(try(trimspace(var.managed_resource_group_name), "")) > 0
        && length(try(var.managed_resource_group_name, "")) <= (var.append_random_suffix ? (90 - 1 - var.random_suffix_length) : 90)
      )
    )
    error_message = "managed_resource_group_name must be 1-90 chars (or null to auto-generate) and leave room for '-<suffix>' when append_random_suffix is true."
  }
}

variable "append_random_suffix" {
  description = "Whether to append a random suffix to the workspace name (and managed RG name, if provided) to avoid collisions."
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

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default     = {}
}
