rg_map = {
  RG1 = {
    rg-name  = "RG-PRD-01"
    location = "westeurope"
  }
}
vnet_map = {
  VNET1 = {
    vnet-name     = "vnetprd01"
    location      = "westeurope"
    rg-name       = "RG-PRD-01"
    address-space = ["10.0.0.0/16"]
  }
}
subnet_map = {
  subnet1 = {
    subnet-name    = "prdsubnet1"
    vnet-name      = "vnetprd01"
    rg-name        = "RG-PRD-01"
    address-prefix = ["10.0.0.0/28"]
  }

    subnet2 = {
      subnet-name    = "AzureBastionSubnet"
      vnet-name      = "vnetprd01"
      rg-name        = "RG-PRD-01"
      address-prefix = ["10.0.1.0/26"]
    }
  }

nic_map = {
  NIC1 = {
    nic-name    = "prdnic01"
    location    = "westeurope"
    rg-name     = "RG-PRD-01"
    vnet-name   = "vnetprd01"
    subnet-name = "prdsubnet1"
  }
}
kv_map = {
  KV01 = {
    kv-name  = "MY-KV-M-prd-001"
    location = "westeurope"
    rg-name  = "RG-PRD-01"

  }
}
vm_map = {
  VM01 = {
    vm-name  = "LINUXVM01"
    location = "westeurope"
    rg-name  = "RG-PRD-01"
    nic-name = "prdnic01"
    kv-name  = "MY-KV-M-prd-001"

  }
}
bas_map = {
  BAS01 = {
    rg-name      = "RG-PRD-01"
    pip-name     = "bastpip"
    location     = "westeurope"
    bastion-name = "bastionforvm"
    subnet-name  = "AzureBastionSubnet"
    vnet-name    = "vnetprd01"
  }
}