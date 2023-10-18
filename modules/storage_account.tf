module "storage_account" {
  source  = "terraform.corp.ad.ctc/azure/storage-account/azurerm"
  version = "5.1.6"

  for_each                     = var.storage_accounts
  environment                  = var.environment
  project_name                 = var.project_name
  containers                   = each.value.containers
  bypass                       = each.value.bypass
  enable_privatelink           = each.value.enable_privatelink
  vault_type                   = "hashicorp"
  enable_customer_managed_keys = false
}
