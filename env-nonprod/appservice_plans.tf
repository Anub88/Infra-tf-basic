locals {
  appservice_plans = {
    vfe_appservice_plan = {
      kind                         = "linux"
      instance_number              = 1
      maximum_elastic_worker_count = 1
      sku_tier                     = "PremiumV3"
      sku_size                     = "P3V3"
      sku_capacity                 = "1"
      reserved                     = true
      per_site_scaling             = true
    }
  }
}
