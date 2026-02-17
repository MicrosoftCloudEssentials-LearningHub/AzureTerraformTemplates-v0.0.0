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
  description = "Whether to append a random suffix to the account name to reduce naming collisions."
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

variable "cognitive_account_name" {
  description = "Base name for the Azure AI Services (Cognitive Services) account. If append_random_suffix is true, the final name will be '<base>-<suffix>'."
  type        = string

  validation {
    condition     = length(trimspace(var.cognitive_account_name)) >= 2 && length(var.cognitive_account_name) <= 48
    error_message = "cognitive_account_name must be between 2 and 48 characters to leave room for optional '-<suffix>'."
  }
}

variable "kind" {
  description = "Cognitive Services kind (examples: CognitiveServices, OpenAI, SpeechServices, TextAnalytics, ComputerVision)."
  type        = string
  default     = "CognitiveServices"
}

variable "sku_name" {
  description = "SKU name (for example: S0)."
  type        = string
  default     = "S0"
}

variable "custom_subdomain_name" {
  description = "Optional custom subdomain for token-based auth. Some configurations (like private endpoints/network ACLs) require this."
  type        = string
  default     = null
}

variable "public_network_access_enabled" {
  description = "Whether public network access is enabled."
  type        = bool
  default     = true
}

variable "enable_system_assigned_identity" {
  description = "Whether to enable a System Assigned Managed Identity on the account."
  type        = bool
  default     = true
}

variable "tags" {
  description = "A map of tags to assign to resources."
  type        = map(string)
  default     = {}
}
