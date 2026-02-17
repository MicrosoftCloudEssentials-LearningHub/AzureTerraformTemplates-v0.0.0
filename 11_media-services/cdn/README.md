# Terraform Template: <br/> CDN (Azure Content Delivery Network) → Azure Front Door (Standard/Premium) 

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2026-02-10

------------------------------------------

> This template contains Terraform configurations to create an Azure Front Door (Standard/Premium) profile and endpoint suitable for serving media assets (for example, fronting a storage/web origin).

> [!NOTE]
> `Azure CDN (classic) profiles (for example`Standard_Microsoft`) no longer support new profile creation.` This template uses the modern Azure Front Door resources (`azurerm_cdn_frontdoor_*`).
> The modern replacement for “Microsoft-managed global CDN + edge routing” is Azure Front Door Standard/Premium. It provides the CDN capability, but it’s provisioned via azurerm_cdn_frontdoor_* resources (Front Door profile/endpoint/route/origin), not azurerm_cdn_profile. <br/>
>
> - If you already have classic CDN resources: Terraform can often still manage them.
> - If you’re creating new: you generally need Front Door Standard/Premium (or another supported CDN provider SKU where available), because classic Microsoft CDN can’t be created anymore.

<img width="650" alt="image" src="https://github.com/user-attachments/assets/75a4af56-de34-4d3b-81c2-d83cd906ec63" />

<img width="650" alt="image" src="https://github.com/user-attachments/assets/aacf9313-0032-4e31-8d9b-bb4ff7a5bb56" />

## File Descriptions

- **main.tf**: Creates the Resource Group, Front Door Profile, Endpoint, Origin Group, Origin, and a default Route.
- **variables.tf**: Defines the input variables used in the Terraform configuration.
- **provider.tf**: Configures the Azure provider (uses Azure CLI auth context).
- **terraform.tfvars**: Provides example values for the variables defined in `variables.tf`.
- **outputs.tf**: Defines outputs such as CDN profile ID, endpoint ID, and endpoint host name.

## Variables

| Variable Name | Description | Type | Example Value |
| --- | --- | --- | --- |
| `resource_group_name` | The name of the resource group to create. | string | `"rg-media-services-dev"` |
| `location` | Azure region for deployment. | string | `"East US"` |
| `cdn_profile_name` | Front Door profile name. | string | `"cdn-media-services-dev-001"` |
| `cdn_sku` | Front Door profile SKU. | string | `"Standard_AzureFrontDoor"` |
| `cdn_endpoint_name` | Front Door endpoint name. | string | `"cdn-media-dev-001"` |
| `origin_host` | Origin hostname (no scheme/path). | string | `"myorigin.example.com"` |
| `tags` | Tags applied to supported resources. | map(string) | `{ env = "dev" }` |

## Usage

1. Authenticate:

   ```sh
   az login
   ```

2. (Optional) Select subscription:

   ```sh
   az account set --subscription "<subscription-id-or-name>"
   ```

3. Initialize:

   ```sh
   terraform init -upgrade
   ```

4. Validate and plan:

   ```sh
   terraform validate
   terraform plan
   ```

5. Apply:

   ```sh
   terraform apply -auto-approve
   ```

## Outputs

| Output Name | Description |
| --- | --- |
| `cdn_profile_id` | The ID of the CDN profile. |
| `cdn_endpoint_id` | The ID of the CDN endpoint. |
| `cdn_endpoint_host_name` | The host name (FQDN) of the CDN endpoint. |

<!-- START BADGE -->
<div align="center">
  <img src="https://img.shields.io/badge/Total%20views-1930-limegreen" alt="Total views">
  <p>Refresh Date: 2026-02-17</p>
</div>
<!-- END BADGE -->
