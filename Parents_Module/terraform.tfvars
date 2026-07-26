rgs = {
  rg1 = {
    rg_name  = "rg_dev"
    location = "SouthIndia"
  }
 rg2 = {
    rg_name  = "rg_dev2"
    location = "SouthIndia"
  }
}

vnets = {
  vnet1 = {
    vnet_name     = "vnet_dev"
    location      = "SouthIndia"
    rg_name       = "rg_dev"
    address_space = ["10.0.0.0/16"]
  }
}

snets = {
  snet1 = {
    snet_name        = "snet_dev"
    rg_name          = "rg_dev"
    vnet_name        = "vnet_dev"
    address_prefixes = ["10.0.1.0/24"]
  }
  snet2 = {
    snet_name        = "snet_dev2"
    rg_name          = "rg_dev"
    vnet_name        = "vnet_dev"
    address_prefixes = ["10.0.2.0/24"]
  }
  snet_bastion = {
    snet_name        = "AzureBastionSubnet"
    rg_name          = "rg_dev"
    vnet_name        = "vnet_dev"
    address_prefixes = ["10.0.3.0/26"]
  }
  snet_appgw = {
    snet_name        = "snet_appgw"
    rg_name          = "rg_dev"
    vnet_name        = "vnet_dev"
    address_prefixes = ["10.0.4.0/24"]
  }
}

pips = {
  pip1 = {
    pip_name          = "pip_dev"
    location          = "SouthIndia"
    rg_name           = "rg_dev"
    allocation_method = "Static"
    sku               = "Standard"
  }
  pip2 = {
    pip_name          = "pip_dev2"
    location          = "SouthIndia"
    rg_name           = "rg_dev"
    allocation_method = "Static"
    sku               = "Standard"
  }
  pip_bastion = {
    pip_name          = "pip_bastion"
    location          = "SouthIndia"
    rg_name           = "rg_dev"
    allocation_method = "Static"
    sku               = "Standard"
  }
  pip_lb = {
    pip_name          = "pip_lb"
    location          = "SouthIndia"
    rg_name           = "rg_dev"
    allocation_method = "Static"
    sku               = "Standard"
  }
  pip_appgw = {
    pip_name          = "pip_appgw"
    location          = "SouthIndia"
    rg_name           = "rg_dev"
    allocation_method = "Static"
    sku               = "Standard"
  }
}

vms = {
  vm1 = {
    nic_name       = "nic_dev"
    location       = "SouthIndia"
    rg_name        = "rg_dev"
    snet_name      = "snet_dev"
    vnet_name      = "vnet_dev"
    vm_name        = "vm-dev"
    pip_name       = "pip_dev"
    vm_size        = "Standard_D2as_v5"
    admin_username = "devopsadmin"
    admin_password = "Devops@123"
  }
  vm2 = {
    nic_name       = "nic_dev2"
    location       = "SouthIndia"
    rg_name        = "rg_dev"
    snet_name      = "snet_dev2"
    vnet_name      = "vnet_dev"
    vm_name        = "vm-dev2"
    pip_name       = "pip_dev2"
    vm_size        = "Standard_D2as_v5"
    admin_username = "devopsadmin"
    admin_password = "Devops@123"
  }
}

bastions = {
  bastion1 = {
    bastion_name = "bastion-dev"
    location     = "SouthIndia"
    rg_name      = "rg_dev"
    vnet_name    = "vnet_dev"
    snet_name    = "AzureBastionSubnet"
    pip_name     = "pip_bastion"
  }
}

lbs = {
  lb1 = {
    lb_name  = "lb-dev"
    location = "SouthIndia"
    rg_name  = "rg_dev"
    pip_name = "pip_lb"
    sku      = "Standard"
  }
}

appgws = {
  appgw1 = {
    appgw_name    = "appgw-dev"
    location      = "SouthIndia"
    rg_name       = "rg_dev"
    vnet_name     = "vnet_dev"
    snet_name     = "snet_appgw"
    pip_name      = "pip_appgw"
    sku_name      = "Standard_v2"
    sku_tier      = "Standard_v2"
    capacity      = 2
    frontend_port = 80
    backend_port  = 80
  }
}

