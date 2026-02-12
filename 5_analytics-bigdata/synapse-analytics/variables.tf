# variables.tf
# This file defines the input variables used in the Terraform configuration.

variable "resource_group_name" {
  description = "The name of the Azure Resource Group to deploy Synapse into. If create_resource_group is true, Terraform will create this resource group."
  type        = string

  validation {
    condition     = length(trimspace(var.resource_group_name)) > 0
    error_message = "resource_group_name must not be empty."
  }
}

variable "location" {
  description = "The Azure region where the Resource Group and Synapse workspace will be created."
  type        = string

  validation {
    condition     = length(trimspace(var.location)) > 0
    error_message = "location must not be empty."
  }
}

variable "synapse_workspace_name" {
  description = "Base name of the Synapse workspace. If append_random_suffix is true, the final name will be '<base>-<suffix>'."
  type        = string

  validation {
    condition = (
      length(trimspace(var.synapse_workspace_name)) > 0
      && can(regex("^[a-zA-Z0-9][a-zA-Z0-9-]*$", var.synapse_workspace_name))
      && length(var.synapse_workspace_name) <= (var.append_random_suffix ? (45 - 1 - var.random_suffix_length) : 45)
    )
    error_message = "synapse_workspace_name must be 1-45 chars, start with alphanumeric, contain only alphanumeric or '-', and leave room for '-<suffix>' when append_random_suffix is true."
  }
}

variable "managed_resource_group_name" {
  description = "Optional base name of the Synapse managed resource group. If null/omitted, the template auto-generates a name. If append_random_suffix is true, the final name will be '<base>-<suffix>'."
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

variable "storage_account_name" {
  description = "Base name of the Storage Account (lowercase alphanumeric, 3-24 chars). If append_random_suffix is true, the final name will be '<base><suffix>' (no dash)."
  type        = string

  validation {
    condition = (
      length(trimspace(var.storage_account_name)) >= 3
      && can(regex("^[a-z0-9]+$", var.storage_account_name))
      && length(var.storage_account_name) <= (var.append_random_suffix ? (24 - var.random_suffix_length) : 24)
    )
    error_message = "storage_account_name must be lowercase alphanumeric, 3-24 chars, and leave room for the suffix (no dash) when append_random_suffix is true."
  }
}

variable "filesystem_name" {
  description = "Name of the ADLS Gen2 filesystem (implemented as a private blob container)."
  type        = string

  validation {
    condition = (
      length(trimspace(var.filesystem_name)) > 0
      && length(var.filesystem_name) <= 63
      && can(regex("^[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$", var.filesystem_name))
    )
    error_message = "filesystem_name must be 1-63 chars, lowercase alphanumeric or '-', and start/end with alphanumeric."
  }
}

variable "sql_administrator_login" {
  description = "SQL administrator login for the Synapse workspace."
  type        = string

  validation {
    condition     = length(trimspace(var.sql_administrator_login)) > 0
    error_message = "sql_administrator_login must not be empty."
  }
}

variable "sql_administrator_password" {
  description = "SQL administrator password for the Synapse workspace. Prefer providing via TF_VAR_sql_administrator_password environment variable."
  type        = string
  sensitive   = true

  validation {
    condition = (
      length(var.sql_administrator_password) >= 8
      && (
        (can(regex("[A-Z]", var.sql_administrator_password)) ? 1 : 0)
        + (can(regex("[a-z]", var.sql_administrator_password)) ? 1 : 0)
        + (can(regex("[0-9]", var.sql_administrator_password)) ? 1 : 0)
        + (can(regex("[^A-Za-z0-9]", var.sql_administrator_password)) ? 1 : 0)
      ) >= 3
    )
    error_message = "sql_administrator_password must be at least 8 characters and include characters from at least 3 of: uppercase, lowercase, digits, special."
  }
}

variable "append_random_suffix" {
  description = "Whether to append a random suffix to globally-unique names (workspace, managed RG, and storage account) to avoid collisions."
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
