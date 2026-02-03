# Terraform Template - Azure Cosmos DB

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2026-02-03

----------

> This template contains Terraform configurations to create and manage an Azure Cosmos DB Account with dependencies on a Resource Group. Below is a description of the files and the variables used in this template.

> [!NOTE]
> The Cosmos DB Account depends on the Resource Group. Terraform ensures that the Resource Group is created before the Cosmos DB Account by using the `depends_on` argument in the configuration.

<p align="center">
    <img width="550" alt="image" src="https://github.com/user-attachments/assets/9948cf73-6748-4e77-b47c-4d4af95fe878">
</p>

## File Descriptions

- **main.tf**: Contains the main configuration for creating the Azure Cosmos DB Account and the Resource Group it depends on.
- **variables.tf**: Defines the input variables used in the Terraform configuration.
- **provider.tf**: Configures the Azure provider to interact with Azure resources.
- **terraform.tfvars**: Provides default values for the variables defined in `variables.tf`.
- **outputs.tf**: Defines the outputs of the Terraform configuration, such as the Cosmos DB Account name and associated Resource Group.

## Variables

Below is a list of variables used in this template, their expected values, types, and examples:

| Variable Name             | Description                                      | Type   | Example Value         |
| --- | --- | --- | --- |
| `resource_group_name` | The name of the Azure Resource Group to associate the Cosmos DB Account with. | string | `"my-resource-group"` |
| `location` | The Azure region where the Resource Group will be created. | string | `"East US"` |
| `cosmosdb_account_name` | The name of the Azure Cosmos DB Account to create. | string | `"mycosmosdbaccount"` |
| `subscription_id` | The Azure subscription ID to use for the AzureRM provider. | string | `"your-subscription-id"` |
| `tags` | A map of tags to assign to the resources. | map | `{ "env": "dev" }` |

<!-- START BADGE -->
<div align="center">
  <img src="https://img.shields.io/badge/Total%20views-1283-limegreen" alt="Total views">
  <p>Refresh Date: 2026-02-03</p>
</div>
<!-- END BADGE -->

