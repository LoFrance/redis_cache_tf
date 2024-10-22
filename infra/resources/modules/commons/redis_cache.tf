resource "azurerm_redis_cache" "redis" {
  name                = "${local.project}-redis-test-01"
  location            = "${var.location}"
  resource_group_name = data.azurerm_resource_group.dev-lorenzo.name
  capacity            = 0
  family              = "C"
  sku_name            = "Basic"
  non_ssl_port_enabled = true
  minimum_tls_version = "1.2"
  redis_version       = 6

  redis_configuration {
    authentication_enabled           = false
  }

  public_network_access_enabled = false

  tags = var.tags
}