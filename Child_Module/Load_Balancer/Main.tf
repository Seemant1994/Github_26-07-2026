resource "azurerm_lb" "lb" {
  for_each            = var.lb
  name                = each.value.lb_name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  sku                 = lookup(each.value, "sku", "Standard")

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = data.azurerm_public_ip.pip[each.key].id
  }
}

resource "azurerm_lb_backend_address_pool" "bap" {
  for_each        = var.lb
  loadbalancer_id = azurerm_lb.lb[each.key].id
  name            = "BackEndAddressPool"
}

resource "azurerm_lb_probe" "probe" {
  for_each        = var.lb
  loadbalancer_id = azurerm_lb.lb[each.key].id
  name            = "http-probe"
  port            = lookup(each.value, "probe_port", 80)
  protocol        = lookup(each.value, "probe_protocol", "Http")
  request_path    = lookup(each.value, "probe_protocol", "Http") == "Http" || lookup(each.value, "probe_protocol", "Http") == "Https" ? lookup(each.value, "probe_path", "/") : null
}

resource "azurerm_lb_rule" "lb_rule" {
  for_each                       = var.lb
  loadbalancer_id                = azurerm_lb.lb[each.key].id
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = lookup(each.value, "frontend_port", 80)
  backend_port                   = lookup(each.value, "backend_port", 80)
  frontend_ip_configuration_name = "PublicIPAddress"
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.bap[each.key].id]
  probe_id                       = azurerm_lb_probe.probe[each.key].id
}
