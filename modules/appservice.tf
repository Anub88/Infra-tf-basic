module "appservice" {
  source  = "terraform.corp.ad.ctc/azure/app-service/azurerm"
  version = "0.4.8"

  for_each    = var.appservices
  vnet_rg     = "${var.brand}-${var.environment}-corenetwork-${var.location_code}-rg"
  vnet_name   = "${var.brand}-${var.environment}-corenetwork-${var.location_code}-vnet-02"
  subnet_name = "${var.brand}-${var.environment}-corenetwork-${var.location_code}-vnet-02-app02-snet"

  enable_privatelink = true
  environment        = var.environment
  project_name       = var.project_name

  app_type                   = lookup(each.value, "app_type", null)
  app_version                = lookup(each.value, "app_version", null)
  sku_size                   = lookup(each.value, "sku_size", null)
  health_check_path          = lookup(each.value, "health_check_path", "")
  enable_scaling             = lookup(each.value, "enable_scaling", false)
  storage_account            = lookup(each.value, "storage_account", [])
  vnet_integration           = lookup(each.value, "vnet_integration", false)
  zip_deploy                 = lookup(each.value, "zip_deploy", false)
  vnet_integration_subnet_id = lookup(each.value, "vnet_integration_subnet_id", null)
  app_service_plan_id        = lookup(each.value, "app_service_plan_id", null)
  app_settings               = lookup(each.value, "app_settings", null)
  # connection_string          = lookup(each.value, "connection_string", {})

  depends_on = [
    module.storage_account,
    module.appservice-plan
  ]
}
