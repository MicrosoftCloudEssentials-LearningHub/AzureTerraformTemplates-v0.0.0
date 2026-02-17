# Deployment known errors - Overview 

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2026-02-09

----------

> Here is a brief overview of error messages and their solutions.

## Content 

- [401 - Unauthorized](#unauthorized)
- [500 - Internal Server Error](#internal-server-error)

## Unauthorized 

> 401

<p align="center">
  <img width="550" alt="image" src="https://github.com/user-attachments/assets/7c42ef92-6f1e-4dac-a105-f0b5ed4dee4c" />
</p>

```
│ Error: error creating project: Terraform Project
│
│   with mongodbatlas_project.example,
│   on main.tf line 42, in resource "mongodbatlas_project" "example":
│   42: resource "mongodbatlas_project" "example" {
│
│ https://cloud.mongodb.com/api/atlas/v2/groups POST: HTTP 401 Unauthorized (Error code: "") Detail: You are not     
│ authorized for this resource. Reason: Unauthorized. Params: [], BadRequestDetail:
```

> [!TIP]
> Ensure you have added the user, group, or identity to the Atlas organization. This issue can also be resolved by leveraging public and private keys to connect. Check [this for more information about it](

## Internal Server Error

> 500

<p align="center">
  <img width="550" alt="image" src="https://github.com/user-attachments/assets/482a289c-e912-40e2-b13a-4167a763cdfe" />
</p>

```
╷
│ Error: error creating MongoDB Network Peering Connection: https://cloud.mongodb.com/api/atlas/v2/groups/677a5/peers POST: HTTP 500 Internal Server Error (Error code: "UNEXPECTED_ERROR") Detail: Unexpected error. Reason: Internal Server Error. Params: [], BadRequestDetail: 
│
│   with mongodbatlas_network_peering.azure_mongodb,
│   on main.tf line 71, in resource "mongodbatlas_network_peering" "azure_mongodb":
│   71: resource "mongodbatlas_network_peering" "azure_mongodb" {
│
```

> [!TIP]
> Please ensure you have configured the Terraform module correctly. You can use [this template as a guide](/1_storage-databases/mongo-atlas/main.tf).
> Also, make sure you have created the service principal with the correct permissions. [Validate the connection before continuing, as shown in the video](https://github.com/MicrosoftCloudEssentials-LearningHub/AzureTerraformTemplates-v0.0.0/tree/main/1_storage-databases/mongo-atlas#permissions-required).
 
<!-- START BADGE -->
<div align="center">
  <img src="https://img.shields.io/badge/Total%20views-1930-limegreen" alt="Total views">
  <p>Refresh Date: 2026-02-17</p>
</div>
<!-- END BADGE -->
