data "azurerm_subnet" "main" {
  name                 = "${var.brand}-${var.environment}-corenetwork-${var.location_code}-vnet-app01-snet"
  virtual_network_name = "${var.brand}-${var.environment}-corenetwork-${var.location_code}-vnet"
  resource_group_name  = "${var.brand}-${var.environment}-corenetwork-${var.location_code}-rg"
}

locals {
  appservices = {
    app_service_1 = {
      app_type            = "dotnetcore"
      app_version         = "3.1"
      sku_size            = "P3V3"
      health_check_path   = ""
      subnet_id           = data.azurerm_subnet.main.id
      app_service_plan_id = module.main.app_service_plan_id["noi_appservice_plan"]
      enable_scaling      = false
      storage_account = [
        {
          name         = "test-client-blob"
          type         = "AzureBlob"
          account_name = module.main.storage_account_name["test_client_blob"]
          share_name   = module.main.storage_container_name["test_client_blob"]["test-client-blob"]
          access_key   = module.main.storage_primary_access_key["test_client_blob"]
      }]
    }
    app_service_2 = {
      app_type            = "node"
      app_version         = "14-lts"
      sku_size            = "P3V3"
      health_check_path   = ""
      subnet_id           = data.azurerm_subnet.main.id
      app_service_plan_id = module.main.app_service_plan_id["noi_appservice_plan"]
      enable_scaling      = false
      storage_account = [
        {
          name         = "test-client-blob"
          type         = "AzureBlob"
          account_name = module.main.storage_account_name["test_client_blob"]
          share_name   = module.main.storage_container_name["test_client_blob"]["test-client-blob"]
          access_key   = module.main.storage_primary_access_key["test_client_blob"]
      }]
    }
  }
}
