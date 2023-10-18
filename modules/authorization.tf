module "authorization" {
  source  = "terraform.corp.ad.ctc/azure/authorization/azurerm"
  version = "0.1.1"

  role_definition        = var.role_definition
  role_assignment        = var.role_assignment
  user_assigned_identity = var.user_assigned_identity
}