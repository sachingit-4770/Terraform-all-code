module "resource_group_module" {
  source = "../../MODULES/RG"
  rg_map = var.rg_map
}
module "vnet_module" {
  depends_on = [module.resource_group_module]
  source     = "../../MODULES/VNET"
  vnet_map   = var.vnet_map

}
module "subnet_module" {
  depends_on = [module.vnet_module]
  source     = "../../MODULES/SUBNET"
  subnet_map = var.subnet_map
}
module "nic-module" {
  depends_on = [module.subnet_module]
  source     = "../../MODULES/NIC"
  nic_map    = var.nic_map

}
module "kv_module" {
  depends_on = [module.resource_group_module]
  source     = "../../MODULES/KEYVAULT"
  kv_map     = var.kv_map

}
module "vm_module" {
  depends_on = [module.resource_group_module, module.nic-module, module.vnet_module, module.kv_module]
  source     = "../../MODULES/VM"
  vm_map     = var.vm_map

}
module "ag_module" {
  depends_on = [ module.nic-module, module.vm_module]
  source = "../../MODULES/APPGATEWAY"
  ag_map=var.ag_map

}



