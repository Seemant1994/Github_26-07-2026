module "azurerm_resource_group" {
  source = "../Child_Module/Resource_Group"
  rg     = var.rgs
}

module "azurerm_virtual_network" {
  source     = "../Child_Module/Virtual_Network"
  vnet       = var.vnets
  depends_on = [module.azurerm_resource_group]
}

module "azurerm_subnet" {
  source     = "../Child_Module/Subnet"
  snet       = var.snets
  depends_on = [module.azurerm_virtual_network]
}

module "azurerm_public_ip" {
  source     = "../Child_Module/Public _IP"
  pip        = var.pips
  depends_on = [module.azurerm_subnet]
}

module "azurerm_linux_virtual_machine" {
  source     = "../Child_Module/Virtual_Machine"
  vm         = var.vms
  depends_on = [module.azurerm_subnet, module.azurerm_public_ip]
}

module "azurerm_bastion_host" {
  source     = "../Child_Module/Bastion_Host"
  bastion    = var.bastions
  depends_on = [module.azurerm_subnet, module.azurerm_public_ip]
}

module "azurerm_load_balancer" {
  source     = "../Child_Module/Load_Balancer"
  lb         = var.lbs
  depends_on = [module.azurerm_public_ip, module.azurerm_linux_virtual_machine]
}

module "azurerm_application_gateway" {
  source     = "../Child_Module/Application_Gateway"
  appgw      = var.appgws
  depends_on = [module.azurerm_subnet, module.azurerm_public_ip]
}