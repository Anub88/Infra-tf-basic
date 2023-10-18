locals {
  storage_accounts = {
    storage_account_1 = {
      containers         = [{ name = "backend", container_access_type = "private" }, { name = "frontend", container_access_type = "private" }]
      bypass             = ["AzureServices"]
      enable_privatelink = true
    }
  }
}