linux-vms = {
  VM1 = {
    name                = "GOALINUXVM01"
    resource_group_name = "RG_A"
    location            = "eastus"
    size                = "Standard_F2"
    admin_user          = "admiuser"
    admin_password     = "Admin@123456"
      name-nic               = "NIC-A"

  }
    VM2 = {
    name                = "GOALINUXVM02"
    resource_group_name = "RG_B"
    location            = "westus"
    size                = "Standard_F2"
    admin_user          = "admiuser"
    admin_password     = "Admin@123456"
      name-nic              = "NIC-B"

  }

    VM3 = {
    name                = "GOALINUXVM03"
    resource_group_name = "RG_C"
    location            = "westeurope"
    size                = "Standard_F2"
    admin_user          = "admiuser"
    admin_password     = "Admin@123456"
      name-nic               = "NIC-C"

  }
}