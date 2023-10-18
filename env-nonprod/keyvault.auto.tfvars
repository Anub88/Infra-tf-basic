keyvault = {
  keyvault1 = {
    instance_number          = "01"
    purge_protection_enabled = true
    network_acls = {
      bypass         = "AzureServices"
      default_action = "Deny"
    }
    disable_private_endpoint = false
  }
}
