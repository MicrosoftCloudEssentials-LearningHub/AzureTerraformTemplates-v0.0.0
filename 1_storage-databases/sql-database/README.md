# Terraform Template - Azure SQL Database

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2026-02-03

----------

> This template contains Terraform configurations to create and manage an Azure SQL Database with dependencies on a Resource Group and SQL Server. Below is a description of the files and the variables used in this template.

> [!NOTE]
> The SQL Database depends on the SQL Server and Resource Group. Terraform ensures that these resources are created before the SQL Database by using the `depends_on` argument in the configuration.

<p align="center">
    <img width="550" alt="image" src="https://github.com/user-attachments/assets/0bb33732-1ce5-4768-92ef-7d18aadf5b45">
</p>

## File Descriptions

- **main.tf**: Contains the main configuration for creating the Azure SQL Database and the Resource Group and SQL Server it depends on.
- **variables.tf**: Defines the input variables used in the Terraform configuration.
- **provider.tf**: Configures the Azure provider to interact with Azure resources.
- **terraform.tfvars**: Provides default values for the variables defined in `variables.tf`.
- **outputs.tf**: Defines the outputs of the Terraform configuration, such as the SQL Server name, SQL Database name, and associated Resource Group.

## Variables

Below is a list of variables used in this template, their expected values, types, and examples:

| Variable Name | Description | Type | Example Value |
| --- | --- | --- | --- |
| `resource_group_name` | The name of the Azure Resource Group to associate the SQL Database with. | string | `"my-resource-group"` |
| `location` | The Azure region where the Resource Group will be created. | string | `"East US"` |
| `sql_server_name` | The name of the Azure SQL Server to create. | string | `"my-sql-server"` |
| `administrator_login` | The administrator login name for the SQL Server. | string | `"adminuser"` |
| `administrator_login_password` | The administrator login password for the SQL Server. | string | `"P@ssw0rd123"` |
| `sql_database_name` | The name of the Azure SQL Database to create. | string | `"mydatabase"` |
| `sku_name` | The SKU name for the SQL Database (e.g., S0, S1, P1). | string | `"S1"` |
| `subscription_id` | The Azure subscription ID to use for the AzureRM provider. | string | `"your-subscription-id"` |
| `tags` | A map of tags to assign to the resources. | map | `{ "env": "dev" }` |

<!-- START BADGE -->
<div align="center">
  <img src="https://img.shields.io/badge/Total%20views-1283-limegreen" alt="Total views">
  <p>Refresh Date: 2026-02-03</p>
</div>
<!-- END BADGE -->
