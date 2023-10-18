module "keyvault" {
  source                   = "terraform.corp.ad.ctc/azure/keyvault/azurerm"
  version                  = "3.0.2"
  for_each                 = var.keyvault
  environment              = var.environment
  project_name             = var.project_name
  resource_group_name      = var.resource_group_name
  vnet_rg                  = var.vnet_rg
  vnet_name                = var.vnet_name
  subnet_name              = lookup(each.value, "subnet_name", null)
  name_override            = lookup(each.value, "name_override", null)
  disable_private_endpoint = lookup(each.value, "disable_private_endpoint", false)
  custom_policy            = lookup(each.value, "custom_policy", [])
  import_certificates      = lookup(each.value, "import_certificates", [])
  generate_certificates    = lookup(each.value, "generate_certificates", [])
  purge_protection_enabled = lookup(each.value, "purge_protection_enabled", true)
  instance_number          = lookup(each.value, "instance_number", "01")
}