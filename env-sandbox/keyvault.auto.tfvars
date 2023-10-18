keyvault = {
  keyvault1 = {
    instance_number          = "01"
    purge_protection_enabled = true
    network_acls = {
      bypass         = "AzureServices"
      default_action = "Deny"
    }
    subnet_name              = "ctc-sandbox-vfe-cc-subnet"
    disable_private_endpoint = true
  }
}
