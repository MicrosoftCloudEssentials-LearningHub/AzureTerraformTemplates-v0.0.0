# Azure Terraform Sample Templates: Version 0.0.0

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2025-03-11

----------

> This repository is part of a series of repositories, with each repository dedicated to a specific version. This repository focuses exclusively on version 0.0.0. This is the initial version of the template, showcasing sample Terraform templates for deploying and managing Azure resources. These templates are provided as starting points and should be customized to meet your specific requirements and use cases.

<details>
<summary><b>List of References </b> (Click to expand)</summary>

- [Define resources with Bicep, ARM templates, and Terraform AzAPI provider](https://learn.microsoft.com/en-us/azure/templates/)

</details>

## Versioning 

| **Version**   | **Description**                                                                 |
|---------------|---------------------------------------------------------------------------------|
| **0.0.0**     | This is the initial version of the template, showcasing sample configurations.               |
| **0.1.0**     | Added support for additional Azure services.                                   |
| **1.0.0**     | First stable release with a comprehensive set of Azure resources.              |

## Overview 

Templates structure:

```
.
├── README.md
├────── main.tf
├────── variables.tf
├────── provider.tf
├────── terraform.tfvars
├────── outputs.tf
```

- main.tf `(Main Terraform configuration file)`: This file contains the core infrastructure code. It defines the resources you want to create, such as virtual machines, networks, and storage. It's the primary file where you describe your infrastructure in a declarative manner.
- variables.tf `(Variable definitions)`: This file is used to define variables that can be used throughout your Terraform configuration. By using variables, you can make your configuration more flexible and reusable. For example, you can define variables for resource names, sizes, and other parameters that might change between environments.
- provider.tf `(Provider configurations)`: Providers are plugins that Terraform uses to interact with cloud providers, SaaS providers, and other APIs. This file specifies which providers (e.g., AWS, Azure, Google Cloud) you are using and any necessary configuration for them, such as authentication details.
- terraform.tfvars `(Variable values)`: This file contains the actual values for the variables defined in `variables.tf`. By separating variable definitions and values, you can easily switch between different sets of values for different environments (e.g., development, staging, production) without changing the main configuration files.
- outputs.tf `(Output values)`: This file defines the output values that Terraform should return after applying the configuration. Outputs are useful for displaying information about the resources created, such as IP addresses, resource IDs, and other important details. They can also be used as inputs for other Terraform configurations or scripts.

## How to execute it 

```mermaid 
graph TD;
    A[az login] --> B(terraform init)
    B --> C{Terraform provisioning stage}
    C -->|Review| D[terraform plan]
    C -->|Order Now| E[terraform apply]
    C -->|Delete Resource if needed| F[terraform destroy]
```

> [!IMPORTANT]
> Please modify `terraform.tfvars` with your information, then run the following flow. If you need more visual guidance, please check the video that illustrates the provisioning steps. 


1. **Login to Azure**: This command logs you into your Azure account. It opens a browser window where you can enter your Azure credentials. Once logged in, you can manage your Azure resources from the command line.

    ```sh
    cd {to-the-template-resource-folder}
    ```
    
    ```sh
    az login
    ```

    <img width="550" alt="image" src="https://github.com/user-attachments/assets/b8dd07b5-074d-4f3a-b7e9-c1bcd3faedda" />

    <img width="550" alt="image" src="https://github.com/user-attachments/assets/9c2c3a4d-bd1c-4bbf-bd7d-1270f1df8946" />

2. **Initialize Terraform**: Initializes the working directory containing the Terraform configuration files. It downloads the necessary provider plugins and sets up the backend for storing the state.

    ``` sh
    terraform init
    ```

   <img width="550" alt="image" src="https://github.com/user-attachments/assets/726c057a-ed81-4be7-a9ca-cc7c96dfa560" />

3. **Terraform Provisioning Stage**: 

   - **Review**: Creates an execution plan, showing what actions Terraform will take to achieve the desired state defined in your configuration files. It uses the variable values specified in `terraform.tfvars`.

        ```sh
        terraform plan -var-file terraform.tfvars
        ```

        <img width="550" alt="image" src="https://github.com/user-attachments/assets/1bf9b3cb-cdf7-4e10-8ed4-ec3b696d57db" />

   - **Order Now**: Applies the changes required to reach the desired state of the configuration. It prompts for confirmation before making any changes. It also uses the variable values specified in `terraform.tfvars`.

        ```sh
        terraform apply -var-file terraform.tfvars
        ```

        <img width="550" alt="image" src="https://github.com/user-attachments/assets/2b32b63f-3e9f-46da-a5e9-c39360135251">

     
   - **Remove**: Destroys the infrastructure managed by Terraform. It prompts for confirmation before deleting any resources. It also uses the variable values specified in `terraform.tfvars`.
    
        ```sh
        terraform destroy -var-file terraform.tfvars
        ```

        <img width="550" alt="image" src="https://github.com/user-attachments/assets/f2089d03-3a3d-431d-b462-8148ef519104">


<div align="center">
  <h3 style="color: #4CAF50;">Total Visitors</h3>
  <img src="https://profile-counter.glitch.me/brown9804/count.svg" alt="Visitor Count" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
</div>
