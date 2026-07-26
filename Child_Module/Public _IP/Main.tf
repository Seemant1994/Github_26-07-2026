resource "azurerm_public_ip" "pip" {
  for_each            = var.pip
  name                = each.value.pip_name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  allocation_method   = each.value.allocation_method
  sku                 = lookup(each.value, "sku", "Standard")
}
