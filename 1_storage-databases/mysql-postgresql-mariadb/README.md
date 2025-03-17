# Terraform Template - MySQL, PostgreSQL, MariaDB

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2025-02-21

------------------------------------------

> This template contains Terraform configurations to create and manage MySQL, PostgreSQL, and MariaDB databases with dependencies on a Resource Group and Database Server. Below is a description of the files and the variables used in this template.

> [!NOTE]
> The databases depend on the Database Server and Resource Group. Terraform ensures that these resources are created before the databases by using the `depends_on` argument in the configuration.

<p align="center">
    <img width="550" alt="image" src="">

</p>

## File Descriptions

- **main.tf**: Contains the main configuration for creating the MySQL, PostgreSQL, and MariaDB databases and the Resource Group and Database Server they depend on.
- **variables.tf**: Defines the input variables used in the Terraform configuration.
- **provider.tf**: Configures the provider to interact with the database resources.
- **terraform.tfvars**: Provides default values for the variables defined in `variables.tf`.
- **outputs.tf**: Defines the outputs of the Terraform configuration, such as the Database Server name, Database names, and associated Resource Group.

## Variables

Below is a list of variables used in this template, their expected values, types, and examples:

| Variable Name             | Description                                      | Type   | Example Value         |
|---------------------------|--------------------------------------------------|--------|-----------------------|
| `resource_group_name`     | The name of the Resource Group to associate the databases with. | string | `"my-resource-group"` |
| `location`                | The region where the Resource Group will be created. | string | `"East US"`           |
| `database_server_name`    | The name of the Database Server to create.       | string | `"mydbserver"`        |
| `mysql_database_name`     | The name of the MySQL database to create.        | string | `"mysql_db"`          |
| `postgresql_database_name`| The name of the PostgreSQL database to create.   | string | `"postgresql_db"`     |
| `mariadb_database_name`   | The name of the MariaDB database to create.      | string | `"mariadb_db"`        |
| `subscription_id`         | The subscription ID to use for the provider.     | string | `"your-subscription-id"` |
| `tags`                    | A map of tags to assign to the resources.        | map    | `{ "env": "dev" }`    |

<div align="center">
  <h3 style="color: #4CAF50;">Total Visitors</h3>
  <img src="https://profile-counter.glitch.me/brown9804/count.svg" alt="Visitor Count" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
</div>
