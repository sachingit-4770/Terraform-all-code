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
    kv-name  = "MY-KV-M-prd-003"
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
    vm-name  = "mylinuxvmag"
    location = "westeurope"
    rg-name  = "RG-PRD-02"
    nic-name = "prdnic01"
    avset-name = "agavset"
    kv-name  = "MY-KV-M-prd-003"


  }  
  # VM02 = {
  #   vm-name  = "frontendvm02"
  #   location = "westeurope"
  #   rg-name  = "RG-PRD-02"
  #   nic-name = "prdnic02"
  #   kv-name  = "MY-KV-M-prd-003"
  #   avset-name = "lbavset"
    
  # }
}
ag_map = {
  AG01 ={
    subnet-name    = "subnetag"
    vnet-name      = "vnetprd01"
    rg-name        = "RG-PRD-02"
    address-prefix = ["10.0.3.0/26"]
    ag-name ="my-ag"
gw-ipconfig ="mygw-ip"
fe-ip = "myfeip"
pip-name = "myag-pip"
fe-port ="myport"
location ="westeurope"
list-name = "mylistner"
r-rule = "myrule"


  }

}