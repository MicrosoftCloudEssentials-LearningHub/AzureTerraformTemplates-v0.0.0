variable "app_display_name" {
  description = "The display name for the Entra ID application registration"
  type        = string
}

variable "sign_in_audience" {
  description = "The Microsoft account types that are supported for the application"
  type        = string
  default     = "AzureADMyOrg"
}

variable "application_owners" {
  description = "Optional set of object IDs to set as owners for the application (users or service principals). If empty, the current principal is used."
  type        = set(string)
  default     = []
}

variable "create_service_principal" {
  description = "Whether to create a service principal for the application"
  type        = bool
  default     = true
}

variable "use_existing_service_principal" {
  description = "When true, an existing service principal linked to the application will be automatically imported"
  type        = bool
  default     = true
}

variable "create_client_secret" {
  description = "Whether to create a client secret (application password)"
  type        = bool
  default     = true
}

variable "client_secret_display_name" {
  description = "Display name for the client secret (application password)"
  type        = string
  default     = "terraform-client-secret"
}

variable "client_secret_end_date_relative" {
  description = "Relative duration for which the client secret is valid (e.g. 240h for 10 days, 4320h for 180 days)"
  type        = string
  default     = "4320h"
}

