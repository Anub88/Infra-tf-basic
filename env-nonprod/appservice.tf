data "azurerm_subnet" "main" {
  name                 = "${var.brand}-${var.environment}-corenetwork-${var.location_code}-vnet-01-vfe01-snet"
  virtual_network_name = "${var.brand}-${var.environment}-corenetwork-${var.location_code}-vnet-01"
  resource_group_name  = "${var.brand}-${var.environment}-corenetwork-${var.location_code}-rg"
}

locals {
  vault_env = "nonprod"
}

data "vault_generic_secret" "vfe-allow-origins" {
  path = "generic/vfe-${local.vault_env}/allow_origins"
}
data "vault_generic_secret" "vfe-allow-origins-external" {
  path = "generic/vfe-${local.vault_env}/allow_origins_external"
}
data "vault_generic_secret" "vfe-snowflake" {
  path = "generic/vfe-${local.vault_env}/snowflake"
}


locals {
  appservices = {
    app_service_1 = {
      app_type                   = "dotnetcore"
      app_version                = "3.1"
      sku_size                   = "P3V3"
      health_check_path          = ""
      vnet_integration           = true
      zip_deploy                 = false
      vnet_integration_subnet_id = data.azurerm_subnet.main.id
      app_service_plan_id        = module.main.app_service_plan_id["vfe_appservice_plan"]
      enable_scaling             = false
      app_settings = {
        "AllowOrigins"                 = data.vault_generic_secret.vfe-allow-origins.data["APPSETTINGS__ALLOWORIGINS"],
        "ConnectionStrings__Snowflake" = data.vault_generic_secret.vfe-snowflake.data["SNOWFLAKE_POC_CONNECTION_STRING"]
        "ASPNETCORE_ENVIRONMENT"       = "Development"
      }
    }
    app_service_2 = {
      app_type                   = "node"
      app_version                = "14-lts"
      sku_size                   = "P3V3"
      health_check_path          = ""
      vnet_integration           = true
      zip_deploy                 = false
      vnet_integration_subnet_id = data.azurerm_subnet.main.id
      app_service_plan_id        = module.main.app_service_plan_id["vfe_appservice_plan"]
      enable_scaling             = false
    }
    app_service_3 = {
      app_type                   = "dotnetcore"
      app_version                = "3.1"
      sku_size                   = "P3V3"
      health_check_path          = ""
      vnet_integration           = true
      zip_deploy                 = false
      vnet_integration_subnet_id = data.azurerm_subnet.main.id
      app_service_plan_id        = module.main.app_service_plan_id["vfe_appservice_plan"]
      enable_scaling             = false
      app_settings = {
        "AllowOrigins"                 = data.vault_generic_secret.vfe-allow-origins-external.data["APPSETTINGS__ALLOWORIGINS"],
        "ConnectionStrings__Snowflake" = data.vault_generic_secret.vfe-snowflake.data["SNOWFLAKE_POC_CONNECTION_STRING"]
        "ASPNETCORE_ENVIRONMENT"       = "Development"
      }
    }
    app_service_4 = {
      app_type                   = "node"
      app_version                = "14-lts"
      sku_size                   = "P3V3"
      health_check_path          = ""
      vnet_integration           = true
      zip_deploy                 = false
      vnet_integration_subnet_id = data.azurerm_subnet.main.id
      app_service_plan_id        = module.main.app_service_plan_id["vfe_appservice_plan"]
      enable_scaling             = false
    }
  }
}