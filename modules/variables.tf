variable "environment" { default = "" }
variable "subscription_id" {}
variable "tenant_id" { default = "bd6704ff-1437-477c-9ac9-c30d6f5133c5" }
variable "costcenter" { default = "9201464" }
variable "location" { default = "Canada Central" }
variable "location_code" { default = "cc" }
variable "project_name" { default = "vfe" }
variable "projectcode" { default = "13008" }
variable "brand" { default = "ctc" }
variable "resource_groups" { default = {} }
variable "resource_group_name" { default = null }
variable "ad_group" { default = {} }
variable "vnet_name" { default = null }
variable "vnet_rg" { default = null }
variable "storage_account" { default = {} }
variable "appservice_plans" { default = {} }
variable "appservices" { default = {} }
variable "keyvault" { default = {} }
