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
  description = "Base name for the Azure IoT Hub. If append_random_suffix is true, the final name will be '<base>-<suffix>'. IoT Hub names must be lowercase and globally unique."
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

variable "device_update_account_name" {
  description = "Base name for the Device Update for IoT Hub account. If append_random_suffix is true, the final name will be '<base>-<suffix>'."
  type        = string

  validation {
    condition     = length(trimspace(var.device_update_account_name)) >= 3
    error_message = "device_update_account_name must be at least 3 characters."
  }
}

variable "device_update_instance_name" {
  description = "Name for the Device Update instance."
  type        = string
  default     = "default"

  validation {
    condition     = length(trimspace(var.device_update_instance_name)) > 0
    error_message = "device_update_instance_name must not be empty."
  }
}

variable "enable_device_update_system_assigned_identity" {
  description = "Whether to enable a System Assigned Managed Identity on the Device Update account."
  type        = bool
  default     = true
}

variable "register_deviceupdate_resource_provider" {
  description = "Whether Terraform should attempt to register the 'Microsoft.DeviceUpdate' resource provider in the current subscription before creating Device Update resources."
  type        = bool
  default     = true
}

variable "tags" {
  description = "A map of tags to assign to resources."
  type        = map(string)
  default     = {}
}
