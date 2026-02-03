# Terraform Template - Azure Kubernetes Service (AKS)

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2026-02-03

----------

> This template contains Terraform configurations to create and manage an Azure Kubernetes Service (AKS) cluster with dependencies on a Resource Group, Virtual Network, and Subnet. Below is a description of the files and the variables used in this template.

> [!NOTE]
> The AKS cluster depends on the Resource Group, Virtual Network, and Subnet. Terraform ensures that these resources are created before the AKS cluster by using the `depends_on` argument in the configuration.

<p align="center">
    <img width="550" alt="image" src="https://github.com/user-attachments/assets/b0461665-8c19-4e10-a0ae-2a79edf3658c">

</p>

<p align="center">
    <img width="550" alt="image" src="https://github.com/user-attachments/assets/c5ce6b2c-3bde-41a9-8ff7-5554c86fa970">

</p>

## File Descriptions

- **main.tf**: Contains the main configuration for creating the Azure Kubernetes Service (AKS) cluster and the resources it depends on.
- **variables.tf**: Defines the input variables used in the Terraform configuration.
- **provider.tf**: Configures the Azure provider to interact with Azure resources.
- **terraform.tfvars**: Provides default values for the variables defined in `variables.tf`.
- **outputs.tf**: Defines the outputs of the Terraform configuration, such as the AKS cluster name, Kubernetes version, and associated Resource Group.

## Variables

Below is a list of variables used in this template, their expected values, types, and examples:

| Variable Name | Description | Type | Example Value |
| --- | --- | --- | --- |
| `resource_group_name` | The name of the Azure Resource Group to associate the AKS cluster with. | string | `"my-resource-group"` |
| `location` | The Azure region where the Resource Group will be created. | string | `"East US"` |
| `virtual_network_name` | The name of the Azure Virtual Network to create. | string | `"my-vnet"` |
| `subnet_name` | The name of the Subnet to create within the Virtual Network. | string | `"my-subnet"` |
| `aks_cluster_name` | The name of the AKS cluster to create. | string | `"my-aks-cluster"` |
| `kubernetes_version` | The version of Kubernetes to use for the AKS cluster. | string | `"1.32"` |
| `node_count` | The number of nodes in the AKS cluster. | number | `3` |
| `node_vm_size` | The size of the Virtual Machines for the nodes. | string | `"Standard_DS2_v2"` |
| `tags` | A map of tags to assign to the resources. | map | `{ "env": "dev" }` |

<!-- START BADGE -->
<div align="center">
  <img src="https://img.shields.io/badge/Total%20views-1283-limegreen" alt="Total views">
  <p>Refresh Date: 2026-02-03</p>
</div>
<!-- END BADGE -->
