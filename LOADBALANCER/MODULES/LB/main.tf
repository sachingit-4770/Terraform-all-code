resource "azurerm_public_ip" "frontend-pip" {
   
    for_each = var.lb_map
  name = each.value.pip-name
  resource_group_name = each.value.rg-name
  location = each.value.location
  allocation_method = "Static"
}



resource "azurerm_lb" "azure-lb" {
  depends_on = [ azurerm_public_ip.frontend-pip ]
 for_each = var.lb_map
 name = each.value.lb-name
 location = each.value.location
 resource_group_name = each.value.rg-name
 

  frontend_ip_configuration {
    name                 = "frontend-ip"
    public_ip_address_id = data.azurerm_public_ip.datapip[each.key].id
  }
}
resource "azurerm_lb_backend_address_pool" "frontend-pool" {
      for_each = var.lb_map
  loadbalancer_id = data.azurerm_lb.datalb[each.key].id
  name            = each.value.backend-name  
}
    resource "azurerm_lb_rule" "frontend-rule" {
        depends_on = [ azurerm_lb_probe.dataprobe ]
                  for_each = var.lb_map
    loadbalancer_id                = data.azurerm_lb.datalb[each.key].id
    name                           = each.value.frontend-rule

    protocol                       = "Tcp"
    frontend_port                  = 80
    backend_port                   = 80
    frontend_ip_configuration_name = "frontend-ip"

    probe_id                 = azurerm_lb_probe.dataprobe[each.key].id
    backend_address_pool_ids = [data.azurerm_lb_backend_address_pool.datapool[each.key].id]
    }


resource "azurerm_lb_probe" "dataprobe" {
    depends_on = [ azurerm_lb.azure-lb ]
  for_each       = var.lb_map
  name           = each.value.probe-name
  loadbalancer_id = data.azurerm_lb.datalb[each.key].id
  port = "80"
}
resource "azurerm_network_interface_backend_address_pool_association" "vm1" {
    for_each = var.lb_map
  network_interface_id    = data.azurerm_network_interface.datanic1[each.key].id
  ip_configuration_name   = "internal"
  backend_address_pool_id = data.azurerm_lb_backend_address_pool.datapool[each.key].id
  
}

resource "azurerm_network_interface_backend_address_pool_association" "vm2" {
    for_each = var.lb_map
  network_interface_id    = data.azurerm_network_interface.datanic2[each.key].id
  ip_configuration_name   = "internal"
  backend_address_pool_id = data.azurerm_lb_backend_address_pool.datapool[each.key].id
   
}

