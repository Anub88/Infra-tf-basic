module "main" {
  source = "../modules"

  environment         = var.environment
  costcenter          = var.costcenter
  projectcode         = var.projectcode
  project_name        = var.project_name
  resource_groups     = local.resource_groups
  resource_group_name = var.resource_group_name
  role_definition     = local.role_definition
  role_assignment     = local.role_assignment
  vnet_name           = var.vnet_name
  vnet_rg             = var.vnet_rg
  storage_accounts    = local.storage_accounts
  appservice_plans    = local.appservice_plans
  keyvault            = var.keyvault
  appservices         = local.appservices
}
