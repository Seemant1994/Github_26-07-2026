resource "azurerm_application_gateway" "appgw" {
  for_each            = var.appgw
  name                = each.value.appgw_name
  resource_group_name = each.value.rg_name
  location            = each.value.location

  sku {
    name     = lookup(each.value, "sku_name", "Standard_v2")
    tier     = lookup(each.value, "sku_tier", "Standard_v2")
    capacity = lookup(each.value, "capacity", 2)
  }

  gateway_ip_configuration {
    name      = "appGatewayIpConfig"
    subnet_id = data.azurerm_subnet.snet[each.key].id
  }

  frontend_port {
    name = "frontendPort"
    port = lookup(each.value, "frontend_port", 80)
  }

  frontend_ip_configuration {
    name                 = "frontendIpConfig"
    public_ip_address_id = data.azurerm_public_ip.pip[each.key].id
  }

  backend_address_pool {
    name = "backendPool"
  }

  backend_http_settings {
    name                  = "httpSettings"
    cookie_based_affinity = "Disabled"
    path                  = "/"
    port                  = lookup(each.value, "backend_port", 80)
    protocol              = "Http"
    request_timeout       = 60
  }

  http_listener {
    name                           = "httpListener"
    frontend_ip_configuration_name = "frontendIpConfig"
    frontend_port_name             = "frontendPort"
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = "rule1"
    rule_type                  = "Basic"
    http_listener_name         = "httpListener"
    backend_address_pool_name  = "backendPool"
    backend_http_settings_name = "httpSettings"
    priority                   = lookup(each.value, "priority", 1)
  }
}
