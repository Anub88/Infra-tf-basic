locals {
  storage_accounts = {
    test_client_blob = {
      containers         = [{ name = "test-client-blob", container_access_type = "private" }]
      bypass             = ["AzureServices"]
      enable_privatelink = false
    }
  }
}
