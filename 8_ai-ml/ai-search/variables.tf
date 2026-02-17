variable "resource_group_name" {
  description = "The name of the Azure Resource Group to deploy into. This template will create the RG if it does not exist (idempotent ARM PUT)."
  type        = string

  validation {
    condition     = length(trimspace(var.resource_group_name)) > 0
    error_message = "resource_group_name must not be empty."
  }
}

variable "location" {
  description = "The Azure region for the deployment."
  type        = string

  validation {
    condition     = length(trimspace(var.location)) > 0
    error_message = "location must not be empty."
  }
}

variable "append_random_suffix" {
  description = "Whether to append a random suffix to the service name to reduce naming collisions."
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

variable "search_service_name" {
  description = "Base name for the Azure AI Search service. If append_random_suffix is true, the final name will be '<base>-<suffix>' (then sanitized to lowercase letters/numbers/hyphens)."
  type        = string

  validation {
    condition     = length(trimspace(var.search_service_name)) >= 2 && length(var.search_service_name) <= 48
    error_message = "search_service_name must be between 2 and 48 characters to leave room for optional '-<suffix>'."
  }
}

variable "sku" {
  description = "Azure AI Search SKU (for example: basic, standard, standard2, standard3)."
  type        = string
  default     = "basic"
}

variable "replica_count" {
  description = "Number of replicas."
  type        = number
  default     = 1
}

variable "partition_count" {
  description = "Number of partitions."
  type        = number
  default     = 1
}

variable "public_network_access_enabled" {
  description = "Whether public network access is enabled."
  type        = bool
  default     = true
}

variable "local_authentication_enabled" {
  description = "Whether local API key auth is enabled."
  type        = bool
  default     = true
}

variable "tags" {
  description = "A map of tags to assign to resources."
  type        = map(string)
  default     = {}
}
