output "rg_id" {
  value = { for k, v in module.rg : k => v.rg_id }
}

output "rg_name" {
  value = { for k, v in module.rg : k => v.rg_name }
}

output "rg_location" {
  value = { for k, v in module.rg : k => v.rg_location }
}

output "rg_environment" {
  value = { for k, v in module.rg : k => v.rg_environment }
}

output "rg_location_code" {
  value = { for k, v in module.rg : k => v.rg_location_code }
}

output "storage_account_name" {
  value       = { for k, v in module.storage_account : k => v.storage_account_name }
  description = "Name of storage account create"
}

output "storage_primary_access_key" {
  value       = { for k, v in module.storage_account : k => v.storage_primary_access_key }
  description = "The primary access key for the storage account."
}

output "storage_container_name" {
  value       = { for k, v in module.storage_account : k => v.storage_container_name }
  description = "Name of the containers"
}

output "app_service_plan_id" {
  value       = { for k, v in module.appservice-plan : k => v.app_service_plan_id }
  description = "The ID of the App Service Plan."
}