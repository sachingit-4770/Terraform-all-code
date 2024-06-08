vnetmap = {
  vnet1 = {

    vnetname      = "db-vnet"
    location      = "eastus"
    rg-name       = "Dynamic-RG"
    address-space = ["172.16.0.0/16"]
    subnets = {
      sub01 = {
        name           = "subnet1"
        address_prefix = "172.16.1.0/24"
      }
      sub02 = {
        name           = "subnet2"
        address_prefix = "172.16.2.0/24"
      }
    }

  }

}



