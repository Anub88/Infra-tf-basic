locals {
  resource_groups = {
    cc_rg = {
      rg_name       = var.project_name
      costcenter    = var.costcenter
      environment   = var.environment
      projectcode   = var.projectcode
      project_name  = var.project_name
      location      = "Canada Central"
      location_code = "cc"
    }
  }
}
