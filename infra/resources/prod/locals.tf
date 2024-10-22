locals {
  prefix    = "io"
  env_short = "d"

  location_short = { westeurope = "weu", italynorth = "itn", germanywestcentral = "gwc", northeurope = "neu" }

  tags = {
    CreatedBy      = "Terraform"
    Environment    = "Dev"
    Owner          = "SM"
    Source         = "https://github.com/pagopa/io-service-management"
    CostCenter     = "TS310 - PAGAMENTI & SERVIZI"
    ManagementTeam = "IO Service Management"
  }
}