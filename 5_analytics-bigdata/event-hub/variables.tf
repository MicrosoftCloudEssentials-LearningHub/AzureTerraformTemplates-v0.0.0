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
  description = "The Azure region where the Resource Group and Event Hubs resources will be created."
  type        = string

  validation {
    condition     = length(trimspace(var.location)) > 0
    error_message = "location must not be empty."
  }
}

variable "append_random_suffix" {
  description = "Whether to append a random suffix to globally-unique names (for example, the Event Hubs namespace) to avoid collisions."
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

variable "eventhub_namespace_name" {
  description = "Base name of the Event Hubs namespace. If append_random_suffix is true, the final name will be '<base>-<suffix>'."
  type        = string

  validation {
    condition = (
      length(trimspace(var.eventhub_namespace_name)) >= 6
      && length(var.eventhub_namespace_name) <= (var.append_random_suffix ? (50 - 1 - var.random_suffix_length) : 50)
      && can(regex("^[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?$", var.eventhub_namespace_name))
    )
    error_message = "eventhub_namespace_name must be 6-50 chars, contain only alphanumeric or '-', start/end with alphanumeric, and leave room for '-<suffix>' when append_random_suffix is true."
  }
}

variable "eventhub_name" {
  description = "Name of the Event Hub to create within the namespace."
  type        = string

  validation {
    condition = (
      length(trimspace(var.eventhub_name)) > 0
      && length(var.eventhub_name) <= 256
      && can(regex("^[a-zA-Z0-9][a-zA-Z0-9._-]*$", var.eventhub_name))
    )
    error_message = "eventhub_name must be 1-256 chars and contain only alphanumeric, '.', '_', or '-'."
  }
}

variable "sku" {
  description = "Event Hubs namespace SKU. Allowed: Basic, Standard, Premium."
  type        = string
  default     = "Standard"

  validation {
    condition     = contains(["Basic", "Standard", "Premium"], var.sku)
    error_message = "sku must be one of: Basic, Standard, Premium."
  }
}

variable "capacity" {
  description = "Namespace capacity. For Basic, this is ignored. For Standard, it represents throughput units; for Premium, it represents messaging units."
  type        = number
  default     = 1

  validation {
    condition     = var.capacity >= 1
    error_message = "capacity must be >= 1."
  }
}

variable "partition_count" {
  description = "Number of partitions for the Event Hub."
  type        = number
  default     = 2

  validation {
    condition     = var.partition_count >= 1 && var.partition_count <= 32
    error_message = "partition_count must be between 1 and 32."
  }
}

variable "message_retention" {
  description = "Message retention in days for the Event Hub."
  type        = number
  default     = 1

  validation {
    condition     = var.message_retention >= 1 && var.message_retention <= 90
    error_message = "message_retention must be between 1 and 90."
  }
}

variable "consumer_group_names" {
  description = "Optional list of consumer group names to create for the Event Hub."
  type        = list(string)
  default     = []
}
