vnetmap = {
  vnet1 = {

    vnetname      = "db-vnet"
    location      = "eastus"
    rg-name       = "Dynamic-RG"
    address-space = ["172.16.0.0/16"]
 
  
    }
  
      vnet2 = {

    vnetname      = "db-vnet2"
    location      = "eastus"
    rg-name       = "Dynamic-RG"
    address-space = ["192.168.0.0/16"]
      }
      
}
    

  
