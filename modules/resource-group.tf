module "rg" {
  source  = "terraform.corp.ad.ctc/azure/rg/azurerm"
  version = "2.3.2"

  for_each           = var.resource_groups
  override_rg_name   = lookup(each.value, "override_rg_name", null)
  project_name       = each.value.project_name
  location           = each.value.location
  environment        = each.value.environment
  location_code      = each.value.location_code
  costcenter         = each.value.costcenter
  projectcode        = each.value.projectcode
  create_vault_space = lookup(each.value, "create_vault_space", true)
}
