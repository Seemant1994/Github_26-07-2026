data "azurerm_subnet" "snet" {
  for_each             = var.bastion
  name                 = each.value.snet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name
}

data "azurerm_public_ip" "pip" {
  for_each            = var.bastion
  name                = each.value.pip_name
  resource_group_name = each.value.rg_name
}
