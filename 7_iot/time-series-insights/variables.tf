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
  description = "Whether to append a random suffix to globally-unique names to reduce naming collisions."
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
  description = "Base name for the Azure IoT Hub used as the ingestion source. If append_random_suffix is true, the final name will be '<base>-<suffix>'. IoT Hub names must be lowercase and globally unique."
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9]([a-z0-9-]{1,48})[a-z0-9]$", var.iothub_name))
    error_message = "iothub_name must be 3-50 characters, lowercase letters/numbers/hyphens, and must start/end with an alphanumeric character."
  }
}

variable "iothub_sku_name" {
  description = "IoT Hub SKU name (F1, B1, S1, S2, S3)."
  type        = string
  default     = "S1"
}

variable "iothub_sku_capacity" {
  description = "IoT Hub SKU capacity (number of units)."
  type        = number
  default     = 1

  validation {
    condition     = var.iothub_sku_capacity >= 1
    error_message = "iothub_sku_capacity must be >= 1."
  }
}

variable "iothub_eventhub_endpoint_name" {
  description = "Event Hub endpoint name on the IoT Hub to bind the consumer group to. Usually 'events'."
  type        = string
  default     = "events"
}

variable "iothub_consumer_group_name" {
  description = "Consumer group name to create for the Time Series Insights event source."
  type        = string
  default     = "tsi"
}

variable "iothub_sas_policy_name" {
  description = "Shared access policy name used by the Time Series Insights event source to read from the IoT Hub."
  type        = string
  default     = "tsi"
}

variable "tsi_environment_name" {
  description = "Base name for the Time Series Insights environment. If append_random_suffix is true, the final name will be '<base>-<suffix>'."
  type        = string

  validation {
    condition     = length(trimspace(var.tsi_environment_name)) >= 3
    error_message = "tsi_environment_name must be at least 3 characters."
  }
}

variable "tsi_sku_name" {
  description = "Time Series Insights environment SKU name."
  type        = string
  default     = "S1"
}

variable "tsi_data_retention_time" {
  description = "ISO 8601 duration for data retention (for example 'P31D')."
  type        = string
  default     = "P31D"
}

variable "tsi_event_source_name" {
  description = "Name of the Time Series Insights event source."
  type        = string
  default     = "iothub"
}

variable "access_policy_principal_object_id" {
  description = "Optional Entra ID object ID to grant access to the Time Series Insights environment (access policy). If null, no access policy is created."
  type        = string
  default     = null
}

variable "access_policy_name" {
  description = "Name for the Time Series Insights access policy (only used when access_policy_principal_object_id is set)."
  type        = string
  default     = "default"
}

variable "access_policy_roles" {
  description = "Roles to grant in the Time Series Insights access policy."
  type        = list(string)
  default     = ["Reader"]
}

variable "tags" {
  description = "A map of tags to assign to resources."
  type        = map(string)
  default     = {}
}
