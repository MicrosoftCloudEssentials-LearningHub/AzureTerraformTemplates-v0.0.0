# Terraform Template - Azure Automation Account

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2026-02-17

------------------------------------------

> This template contains Terraform configurations to create an Azure Automation Account.

<img width="650" alt="image" src="https://github.com/user-attachments/assets/9076fb43-9d42-48ef-821b-6b9ccc624e64" />

<img width="650" alt="image" src="https://github.com/user-attachments/assets/e6bac1ce-4710-45a5-b5ac-b2a083250594" />

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

<!-- START BADGE -->
<div align="center">
  <img src="https://img.shields.io/badge/Total%20views-1930-limegreen" alt="Total views">
  <p>Refresh Date: 2026-02-17</p>
</div>
<!-- END BADGE -->
