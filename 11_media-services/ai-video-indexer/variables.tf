# variables.tf

variable "resource_group_name" {
  description = "The name of the resource group to create."
  type        = string
}

variable "location" {
  description = "Azure region for deployment."
  type        = string
  default     = "East US"
}

variable "video_indexer_account_name" {
  description = "The name of the Azure AI Video Indexer (ARM-based) account to create."
  type        = string
}

variable "storage_account_name" {
  description = "The name of the Storage Account to create and link to Video Indexer. Must be globally unique and meet Azure naming rules."
  type        = string
}

variable "tags" {
  description = "Tags applied to supported resources."
  type        = map(string)
  default = {
    env  = "dev"
    iac  = "terraform"
    area = "media-services"
  }
}
