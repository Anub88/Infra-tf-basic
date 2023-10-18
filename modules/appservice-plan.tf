module "appservice-plan" {
  source  = "terraform.corp.ad.ctc/azure/appservice-plan/azurerm"
  version = "1.0.0"

  for_each                     = var.appservice_plans
  environment                  = var.environment
  name_override                = lookup(each.value, "name_override", null)
  project_name                 = var.project_name
  sku_tier                     = lookup(each.value, "sku_tier", null)
  sku_size                     = lookup(each.value, "sku_size", null)
  sku_capacity                 = lookup(each.value, "sku_capacity", null)
  kind                         = each.value.kind
  reserved                     = lookup(each.value, "reserved", false)
  is_xenon                     = lookup(each.value, "is_xenon", false)
  maximum_elastic_worker_count = lookup(each.value, "maximum_elastic_worker_count", "1")
  per_site_scaling             = lookup(each.value, "per_site_scaling", false)
}
