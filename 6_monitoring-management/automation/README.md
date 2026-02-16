# Terraform Template - Azure Automation Account

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2026-02-16

------------------------------------------

> This template contains Terraform configurations to create an Azure Automation Account.

## File Descriptions

- **main.tf**: Creates the Resource Group (AzAPI) and Automation Account.
- **variables.tf**: Input variables.
- **provider.tf**: AzureRM + AzAPI providers.
- **terraform.tfvars**: Example values.
- **outputs.tf**: Outputs (IDs/names).

## Usage

```sh
az login
terraform init -upgrade
terraform validate
terraform plan
terraform apply -auto-approve
```
