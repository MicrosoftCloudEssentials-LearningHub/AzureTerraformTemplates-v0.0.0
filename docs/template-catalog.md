# Template catalog

The repository groups starter templates by Azure domain. Each folder remains the source of truth for its exact variables, resource versions, prerequisites, and dependencies.

## Platform and application domains

| Domain | Examples | Source |
| --- | --- | --- |
| Core infrastructure | Resource groups, Bastion, DNS, network security groups, public IPs, subnets, and virtual networks. | [Core infrastructure](https://github.com/Cloud2BR-MSFTLearningHub/AzureTerraformTemplates-v0.0.0/tree/main/0_core-infrastructure) |
| Storage and databases | Blob, Data Lake, File Storage, Storage Accounts, Cosmos DB, Azure SQL, PostgreSQL, MySQL, and MongoDB Atlas peering. | [Storage and databases](https://github.com/Cloud2BR-MSFTLearningHub/AzureTerraformTemplates-v0.0.0/tree/main/1_storage-databases) |
| Compute and containers | Virtual Machines, Virtual Desktop, AKS, Functions, Container Instances, Batch, and App Service. | [Compute and containers](https://github.com/Cloud2BR-MSFTLearningHub/AzureTerraformTemplates-v0.0.0/tree/main/2_compute-containers) |
| Networking | Application Gateway, ExpressRoute, Firewall, Front Door, Load Balancer, Traffic Manager, VPN Gateway, and CDN. | [Networking](https://github.com/Cloud2BR-MSFTLearningHub/AzureTerraformTemplates-v0.0.0/tree/main/3_networking) |
| Identity and security | Entra ID, Key Vault, user-assigned managed identities, and Azure Policy assignments. | [Identity and security](https://github.com/Cloud2BR-MSFTLearningHub/AzureTerraformTemplates-v0.0.0/tree/main/4_identity-security) |

## Data, operations, and specialized domains

| Domain | Examples | Source |
| --- | --- | --- |
| Analytics and big data | Data Factory, Databricks, Event Hubs, Fabric capacity, and Synapse workspaces. | [Analytics and big data](https://github.com/Cloud2BR-MSFTLearningHub/AzureTerraformTemplates-v0.0.0/tree/main/5_analytics-bigdata) |
| Monitoring and management | Action Groups, Log Analytics, Automation, and Advisor activity-log alerts. | [Monitoring and management](https://github.com/Cloud2BR-MSFTLearningHub/AzureTerraformTemplates-v0.0.0/tree/main/6_monitoring-management) |
| IoT | IoT Hub, IoT Edge device update, and Digital Twins. | [IoT](https://github.com/Cloud2BR-MSFTLearningHub/AzureTerraformTemplates-v0.0.0/tree/main/7_iot) |
| AI and machine learning | Azure Machine Learning, AI Search, AI Services, and Azure AI Foundry. | [AI and ML](https://github.com/Cloud2BR-MSFTLearningHub/AzureTerraformTemplates-v0.0.0/tree/main/8_ai-ml) |
| Migration, backup, and media | Data Protection Backup Vault, Site Recovery, Front Door CDN, and AI Video Indexer. | [Migration, backup, and media](https://github.com/Cloud2BR-MSFTLearningHub/AzureTerraformTemplates-v0.0.0/tree/main/9_migration-backup) |

## Read a template as a contract

Before reuse, identify its inputs, outputs, dependencies, resource lifecycle behavior, default network exposure, security model, and expected cost drivers. For example, the [AKS template](https://github.com/Cloud2BR-MSFTLearningHub/AzureTerraformTemplates-v0.0.0/tree/main/2_compute-containers/kubernetes-service) depends on a resource group, virtual network, and subnet; those dependencies need architecture and policy review, not merely variable substitution.