terraform {
  backend "remote" {
    hostname     = "terraform.corp.ad.ctc"
    organization = "azure"

    workspaces {
      name = "eis-az-vfe-sandbox"
    }
  }
}
