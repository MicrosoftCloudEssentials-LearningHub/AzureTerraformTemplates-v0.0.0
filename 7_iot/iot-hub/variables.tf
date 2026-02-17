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
  description = "Whether to append a random suffix to the IoT Hub name to reduce naming collisions."
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

variable "iothub_name" {
  description = "Base name for the Azure IoT Hub. If append_random_suffix is true, the final name will be '<base>-<suffix>'. IoT Hub names must be lowercase and globally unique."
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9]([a-z0-9-]{1,48})[a-z0-9]$", var.iothub_name))
    error_message = "iothub_name must be 3-50 characters, lowercase letters/numbers/hyphens, and must start/end with an alphanumeric character."
  }
}

variable "sku_name" {
  description = "IoT Hub SKU name (F1, B1, S1, S2, S3)."
  type        = string
  default     = "S1"
}

variable "sku_capacity" {
  description = "IoT Hub SKU capacity (number of units)."
  type        = number
  default     = 1

  validation {
    condition     = var.sku_capacity >= 1
    error_message = "sku_capacity must be >= 1."
  }
}

variable "event_hub_partition_count" {
  description = "Number of partitions for the built-in Event Hub-compatible endpoint."
  type        = number
  default     = 2

  validation {
    condition     = var.event_hub_partition_count >= 2 && var.event_hub_partition_count <= 128
    error_message = "event_hub_partition_count must be between 2 and 128."
  }
}

variable "min_tls_version" {
  description = "Minimum TLS version enforced by the IoT Hub."
  type        = string
  default     = "1.2"
}

variable "public_network_access_enabled" {
  description = "Whether public network access is enabled for the IoT Hub."
  type        = bool
  default     = true
}

variable "local_authentication_enabled" {
  description = "Whether local (SAS key) authentication is enabled."
  type        = bool
  default     = true
}

variable "tags" {
  description = "A map of tags to assign to resources."
  type        = map(string)
  default     = {}
}
