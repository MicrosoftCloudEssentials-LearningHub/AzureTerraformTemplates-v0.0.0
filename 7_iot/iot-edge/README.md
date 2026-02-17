# Terraform Template - Azure IoT Edge (Device Update for IoT Hub)

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2026-02-17

------------------------------------------

> This template creates an Azure IoT Hub and a Device Update for IoT Hub account + instance.

> [!IMPORTANT]
> If your subscription is not registered for `Microsoft.DeviceUpdate`, the apply can fail with `MissingSubscriptionRegistration`. This template attempts to register the provider automatically via AzAPI (`register_deviceupdate_resource_provider = true`).
>
> Manual fallback:
>
> ```sh
> az provider register --namespace Microsoft.DeviceUpdate
> az provider show --namespace Microsoft.DeviceUpdate --query registrationState -o tsv
> ```

<img width="650" alt="image" src="https://github.com/user-attachments/assets/3f655801-866c-4198-90b1-50d9602bd2ce" />

<img width="650" alt="image" src="https://github.com/user-attachments/assets/5cf31e91-8a42-4fcf-a09b-883f7023e716" />

<img width="650" alt="image" src="https://github.com/user-attachments/assets/888161b1-99bd-416f-9d30-b8fb6755060b" />

<img width="650"  alt="image" src="https://github.com/user-attachments/assets/2e49a469-129a-48fe-ab5b-5dd6305fcf4f" />

## Usage

```sh
az login
terraform init -upgrade
terraform validate
terraform plan
terraform apply -auto-approve
```

<!-- START BADGE -->
<div align="center">
  <img src="https://img.shields.io/badge/Total%20views-1930-limegreen" alt="Total views">
  <p>Refresh Date: 2026-02-17</p>
</div>
<!-- END BADGE -->
