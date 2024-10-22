# Virtual Network (assuming it already exists)
data "azurerm_virtual_network" "this" {
  name                = "io-d-itn-common-vnet-01"
  resource_group_name = "io-d-itn-common-rg-01"
}

# Subnet (assuming it already exists)
data "azurerm_subnet" "subnet" {
  name                 = "io-d-itn-common-pep-snet-01"
  virtual_network_name = data.azurerm_virtual_network.this.name
  resource_group_name  = data.azurerm_virtual_network.this.resource_group_name
}

# Private Endpoint
resource "azurerm_private_endpoint" "private_endpoint" {
  name                = "${local.project}-private-endpoint-test-01"
  location            = azurerm_redis_cache.redis.location
  resource_group_name = data.azurerm_resource_group.dev-lorenzo.name
  subnet_id           = data.azurerm_subnet.subnet.id

  private_service_connection {
    name                           = "devlorprivaendpoint_98e6f994-976f-437a-a315-6a94a5f9101c"
    private_connection_resource_id = azurerm_redis_cache.redis.id
    is_manual_connection           = false
    subresource_names              = ["redisCache"]
  }
}

# Private DNS Zone
resource "azurerm_private_dns_zone" "dns_zone" {
  name                = "${local.project}-private-link-redis-test-01"
  resource_group_name = data.azurerm_resource_group.dev-lorenzo.name
}

# Private DNS Zone Virtual Network Link
resource "azurerm_private_dns_zone_virtual_network_link" "dns_zone_link" {
  name                  = "${local.project}-dns-zone-link-test-01"
  resource_group_name   = data.azurerm_resource_group.dev-lorenzo.name
  private_dns_zone_name = azurerm_private_dns_zone.dns_zone.name
  virtual_network_id    = data.azurerm_virtual_network.this.id
  registration_enabled  = false
}

# Private DNS Zone Group
#resource "azurerm_private_dns_zone_group" "dns_zone_group" {
#  name                = "default"
#  resource_group_name = data.azurerm_resource_group.dev-lorenzo.name
#  private_dns_zone_ids = [azurerm_private_dns_zone.dns_zone.id]
#  private_endpoint_id  = azurerm_private_endpoint.private_endpoint.id
#}