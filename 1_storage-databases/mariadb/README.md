# Terraform Template - MariaDB Server

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2025-02-21

------------------------------------------

> This template contains Terraform configurations to create and manage MariaDB Server with dependencies on a Resource Group and other necessary resources. Below is a description of the files and the variables used in this template.

> [!NOTE]
> The MariaDB Server depends on the Resource Group. Terraform ensures that these resources are created before MariaDB Server by using the `depends_on` argument in the configuration.

<p align="center">
    <img width="550" alt="image" src="">

</p>

## File Descriptions

- **main.tf**: Contains the main configuration for creating the MariaDB Server and the Resource Group that it depends on.
- **variables.tf**: Defines the input variables used in the Terraform configuration.
- **provider.tf**: Configures the provider to interact with the database resources.
- **terraform.tfvars**: Provides default values for the variables defined in `variables.tf`.
- **outputs.tf**: Defines the outputs of the Terraform configuration, such as the MariaDB Server name and administrator login.

## Variables

Below is a list of variables used in this template, their expected values, types, and examples:

| Variable Name             | Description                                      | Type   | Example Value         |
|---------------------------|--------------------------------------------------|--------|-----------------------|
| `resource_group_name`     | The name of the Resource Group to associate the MariaDB Server with. | string | `"example-resources"` |
| `location`                | The region where the Resource Group will be created. | string | `"West US"`           |
| `mariadb_server_name`     | The name of the MariaDB server.                  | string | `"example-mariadb"`   |
| `admin_username`          | The administrator login for the MariaDB server.  | string | `"adminuser"`         |
| `admin_password`          | The administrator password for the MariaDB server. | string | `"P@ssw0rd1234!"`     |
| `sku_capacity`            | The capacity for the SKU.                        | int    | `2`                   |
| `sku_family`              | The family for the SKU.                          | string | `"Gen5"`              |
| `sku_name`                | The name for the SKU.                            | string | `"GP_Gen5_2"`         |
| `sku_size`                | The size for the SKU.                            | string | `"Standard"`          |
| `sku_tier`                | The tier for the SKU.                            | string | `"GeneralPurpose"`    |
| `minimal_tls_version`     | The minimal TLS version.                         | string | `"TLS1_2"`            |
| `public_network_access`   | The public network access setting.               | string | `"Enabled"`           |
| `ssl_enforcement`         | The SSL enforcement setting.                     | string | `"Enabled"`           |
| `backup_retention_days`   | The number of days to retain backups.            | int    | `7`                   |
| `geo_redundant_backup`    | Whether geo-redundant backup is enabled.         | string | `"Disabled"`          |
| `storage_autogrow`        | Whether storage autogrow is enabled.             | string | `"Enabled"`           |
| `storage_mb`              | The storage size in MB.                          | int    | `5120`                |
| `mariadb_version`         | The version of MariaDB.                          | string | `"10.3"`              |
| `subscription_id`         | The subscription ID to use for the provider.     | string | `"your-subscription-id"` 

<div align="center">
  <h3 style="color: #4CAF50;">Total Visitors</h3>
  <img src="https://profile-counter.glitch.me/your-github-username/count.svg" alt="Visitor Count" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
</div>
