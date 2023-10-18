locals {
  role_definition = [
    // App Insights Viewer
    { name        = "CTC NonProd VFE App Insights Viewer"
      description = "Custom Read Role for Application Insights"
      scope       = "/subscriptions/${var.subscription_id}/resourceGroups/ctc-${var.environment}-${var.project_name}-cc-rg"
      actions = [
        "microsoft.web/sites/config/list/action"
      ]
      data_actions = []
      assignable_scopes = [
        "/subscriptions/${var.subscription_id}/resourceGroups/ctc-${var.environment}-${var.project_name}-cc-rg"
      ]
    }
  ]
  role_assignment = [
    // AD group:  AZ-BU-IRBI-DEV readonly access to RG
    {
      name            = "az_bu_irbi_dev_readonly_access"
      scope           = "/subscriptions/${var.subscription_id}/resourceGroups/ctc-${var.environment}-${var.project_name}-cc-rg",
      definition_name = "Reader",
      principal_id    = "79029ec2-15dc-4394-a31d-7595c400dcbc"
    },
    // AD group: Access to 'microsoft.web/sites/config/list/action' - App Insights
    {
      name            = "az_bu_irbi_dev_list_app_insights"
      scope           = "/subscriptions/${var.subscription_id}/resourcegroups/ctc-${var.environment}-${var.project_name}-cc-rg",
      definition_name = "CTC NonProd VFE App Insights Viewer",
      principal_id    = "79029ec2-15dc-4394-a31d-7595c400dcbc" // AD group:  AZ-BU-IRBI-DEV
    }
  ]
}