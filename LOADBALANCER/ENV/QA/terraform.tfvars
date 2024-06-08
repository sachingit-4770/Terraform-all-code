rg_map = {
  RG1 = {
    rg-name  = "RG-PRD-02"
    location = "westeurope"
  }
}
vnet_map = {
  VNET1 = {
    vnet-name     = "vnetprd01"
    location      = "westeurope"
    rg-name       = "RG-PRD-02"
    address-space = ["10.0.0.0/16"]
  }
}
subnet_map = {
  subnet1 = {
    subnet-name    = "prdsubnet1"
    vnet-name      = "vnetprd01"
    rg-name        = "RG-PRD-02"
    address-prefix = ["10.0.0.0/28"]
  }

    subnet2 = {
      subnet-name    = "prdsubnet2"
      vnet-name      = "vnetprd01"
      rg-name        = "RG-PRD-02"
      address-prefix = ["10.0.1.0/26"]
    }
  }

nic_map = {
  NIC1 = {
    nic-name    = "prdnic01"
    location    = "westeurope"
    rg-name     = "RG-PRD-02"
    vnet-name   = "vnetprd01"
    subnet-name = "prdsubnet1"
    nsg-name = "lbvmnsg"
  } 
   NIC2 = {
    nic-name    = "prdnic02"
    location    = "westeurope"
    rg-name     = "RG-PRD-02"
    vnet-name   = "vnetprd01"
    subnet-name = "prdsubnet1"
    nsg-name = "lbvmnsg"
  }
}
kv_map = {
  KV01 = {
    kv-name  = "MY-KV-M-prd-002"
    location = "westeurope"
    rg-name  = "RG-PRD-02"
    pass-value ="Admin@123456"
    user-value ="adminuser"
    user-name = "username"
    password-name = "password"

  }
}
vm_map = {
  VM01 = {
    vm-name  = "frontendvm01"
    location = "westeurope"
    rg-name  = "RG-PRD-02"
    nic-name = "prdnic01"
    avset-name = "lbavset"
    kv-name  = "MY-KV-M-prd-002"


  }  
  VM02 = {
    vm-name  = "frontendvm02"
    location = "westeurope"
    rg-name  = "RG-PRD-02"
    nic-name = "prdnic02"
    kv-name  = "MY-KV-M-prd-002"
    avset-name = "lbavset"
    
  }
}
lb_map = {
  LB01={
pip-name = "frontend-pip"
rg-name = "RG-PRD-02"
location ="westeurope"
nic-name1 = "prdnic01"
nic-name2 = "prdnic02"
lb-name = "frontend-lb"
backend-name = "frontend-pool"
frontend-rule ="rule2"
probe-name = "frontend-probe2"

  }
}