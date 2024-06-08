data "azurerm_subnet" "datasubnet"{
 
    name = "putinsubnet1"
    virtual_network_name = "putinvnet2"
    resource_group_name = "putinrg1"

}
data "azurerm_subnet" "bastion"{
  
    name = "AzureBastionSubnet"
    virtual_network_name = "putinvnet2"
    resource_group_name = "putinrg1"

}
data "azurerm_key_vault" "keyvault" {
  name                = "JJKEYVMY"
  resource_group_name = "Putinrg1"
}
data "azurerm_key_vault_secret" "sachin" {
  depends_on = [ azurerm_key_vault_secret.password ]
  name         = "vmpassword"
  key_vault_id = data.azurerm_key_vault.keyvault.id
}

