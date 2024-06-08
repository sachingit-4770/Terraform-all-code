resource "azurerm_subnet" "mysubnet" {
  for_each             = var.ag_map
  name                 = each.value.subnet-name
  resource_group_name  = each.value.rg-name
  virtual_network_name = each.value.vnet-name
  address_prefixes     = each.value.address-prefix
}

resource "azurerm_public_ip" "pip" {
  for_each            = var.ag_map
  name                = each.value.pip-name
  resource_group_name = each.value.rg-name
  location            = each.value.location
  allocation_method   = "Static"
  sku = "Standard"
}



resource "azurerm_application_gateway" "network" {
  for_each            = var.ag_map
  depends_on          = [azurerm_public_ip.pip, azurerm_subnet.mysubnet]
  name                = each.value.ag-name
  resource_group_name = each.value.rg-name
  location            = each.value.location

  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 2
  }

  gateway_ip_configuration {

    name      = each.value.gw-ipconfig
    subnet_id = data.azurerm_subnet.datasubnet[each.key].id
  }

  frontend_port {
    name = each.value.fe-port
    port = 80
  }

  frontend_ip_configuration {

    name                 = each.value.fe-ip
    public_ip_address_id = data.azurerm_public_ip.datapip[each.key].id
  }

  backend_address_pool {
    name = "backend_address_pool_name"
  }

  backend_http_settings {
    name                  = "http_setting_name"
    cookie_based_affinity = "Disabled"
    path                  = "/path1/"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
  }

  http_listener {
    name                           = each.value.list-name
    frontend_ip_configuration_name = each.value.fe-ip
    frontend_port_name             = each.value.fe-port
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = each.value.r-rule
    priority                   = 9
    rule_type                  = "Basic"
    http_listener_name         = each.value.list-name
    backend_address_pool_name  = "backend_address_pool_name"
    backend_http_settings_name = "http_setting_name"
  }
}