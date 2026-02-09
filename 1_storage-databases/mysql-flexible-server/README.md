# Terraform Template - MySQL Flexible Server

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2026-02-03

------------------------------------------

> This template contains Terraform configurations to create and manage MySQL Flexible Server with dependencies on a Resource Group and other necessary resources. Below is a description of the files and the variables used in this template.

> [!NOTE]
> The MySQL Flexible Server depends on the Resource Group. Terraform ensures that these resources are created before MySQL Flexible Server by using the `depends_on` argument in the configuration.

<p align="center">
    <img width="550" alt="image" src="https://github.com/user-attachments/assets/772af36b-ad53-499c-83fe-548547b5256d">
</p>

## File Descriptions

- **main.tf**: Contains the main configuration for creating the MySQL Flexible Server and the Resource Group that depend on.
- **variables.tf**: Defines the input variables used in the Terraform configuration.
- **provider.tf**: Configures the provider to interact with the database resources.
- **terraform.tfvars**: Provides default values for the variables defined in `variables.tf`.
- **outputs.tf**:  Defines the outputs of the Terraform configuration, such as the MySQL Server name and administrator login.

## Variables

Below is a list of variables used in this template, their expected values, types, and examples:

| Variable Name | Description | Type | Example Value |
| --- | --- | --- | --- |
| `resource_group_name` | The name of the Resource Group to associate the MySQL Flexible Server with. | string | `"example-resources"` |
| `location` | The region where the Resource Group will be created. | string | `"West US"` |
| `administrator_login` | The administrator login for the MySQL server. | string | `"adminuser"` |
| `administrator_password` | The administrator password for the MySQL server. | string | `"P@ssw0rd1234!"` |
| `sku_name` | The SKU name for the MySQL server. | string | `"GP_Standard_D2ds_v4"` |
| `mysql_version` | The version of MySQL. | string | `"8.0.21"` |
| `backup_retention_days` | The number of days to retain backups. | number | `7` |
| `high_availability_mode` | The high availability mode. | string | `"SameZone"` |
| `maintenance_window_day_of_week` | The day of the week for maintenance. | number | `0` |
| `maintenance_window_start_hour` | The start hour for maintenance. | number | `8` |
| `maintenance_window_start_minute` | The start minute for maintenance. | number | `0` |
| `storage_iops` | The IOPS for the storage. | number | `360` |
| `storage_size_gb` | The size of the storage in GB. | number | `20` |
| `subscription_id` | The subscription ID to use for the provider. | string | `"your-subscription-id"` |

<!-- START BADGE -->
<div align="center">
  <img src="https://img.shields.io/badge/Total%20views-1646-limegreen" alt="Total views">
  <p>Refresh Date: 2026-02-09</p>
</div>
<!-- END BADGE -->
