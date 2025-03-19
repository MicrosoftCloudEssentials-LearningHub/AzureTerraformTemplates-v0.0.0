# Terraform Template - PostgreSQL Server

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2025-03-19

----------

> This template contains Terraform configurations to create and manage PostgreSQL Server with dependencies on a Resource Group and other necessary resources. Below is a description of the files and the variables used in this template.

> [!NOTE]
> The PostgreSQL Server depends on the Resource Group. Terraform ensures that these resources are created before PostgreSQL Server by using the `depends_on` argument in the configuration.

<p align="center">
    <img width="550" alt="image" src="">

</p>

## File Descriptions

- **main.tf**: Contains the main configuration for creating the PostgreSQL Server and the Resource Group that it depends on.
- **variables.tf**: Defines the input variables used in the Terraform configuration.
- **provider.tf**: Configures the provider to interact with the database resources.
- **terraform.tfvars**: Provides default values for the variables defined in `variables.tf`.
- **outputs.tf**: Defines the outputs of the Terraform configuration, such as the PostgreSQL Server name and administrator login.

## Variables

Below is a list of variables used in this template, their expected values, types, and examples:

| Variable Name             | Description                                      | Type   | Example Value         |
|---------------------------|--------------------------------------------------|--------|-----------------------|
| `resource_group_name`     | The name of the Resource Group to associate the PostgreSQL Server with. | string | `"example-resources"` |
| `location`                | The region where the Resource Group will be created. | string | `"West US"`           |
| `postgresql_server_name`  | The name of the PostgreSQL server.               | string | `"example-postgresql"`|
| `admin_username`          | The administrator login for the PostgreSQL server. | string | `"adminuser"`         |
| `admin_password`          | The administrator password for the PostgreSQL server. | string | `"P@ssw0rd1234!"`     |
| `sku_name`                | The SKU name for the PostgreSQL server.          | string | `"B_Gen5_1"`          |
| `postgresql_version`      | The version of PostgreSQL.                       | string | `"11"`                |
| `backup_retention_days`   | The number of days to retain backups.            | number | `7`                   |
| `geo_redundant_backup_enabled` | Whether geo-redundant backup is enabled. | bool   | `false`               |
| `auto_grow_enabled`       | Whether auto-grow is enabled.                    | bool   | `true`                |
| `ssl_enforcement_enabled` | Whether SSL enforcement is enabled.              | bool   | `true`                |
| `subscription_id`         | The subscription ID to use for the provider.     | string | `"your-subscription-id"` |

<div align="center">
  <h3 style="color: #4CAF50;">Total Visitors</h3>
  <img src="https://profile-counter.glitch.me/your-github-username/count.svg" alt="Visitor Count" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
</div>

