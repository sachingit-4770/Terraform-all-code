resource "azurerm_public_ip" "lbpublicip" {
  name                = "lbpublic-ip"
  location            = "centralindia"
  resource_group_name = "lbrg"
  allocation_method   = "Static"
  sku = "Standard"
}

resource "azurerm_lb" "mylb" {
  name                = "TestLoadBalancer"
  location            = "centralindia"
  resource_group_name = "lbrg"
  sku = "Standard"

  frontend_ip_configuration {
    name                 = "frontendip"
    public_ip_address_id = azurerm_public_ip.lbpublicip.id
  }
}
resource "azurerm_lb_probe" "lbhelthprobe" {
  loadbalancer_id = azurerm_lb.mylb.id
  name            = "ssh-running-probe"
  port            = 22
}
resource "azurerm_lb_rule" "rule1" {
  loadbalancer_id                = azurerm_lb.mylb.id
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "frontendip"
}
resource "azurerm_lb_backend_address_pool" "mypool" {
  loadbalancer_id = azurerm_lb.mylb.id
  name            = "BackEndAddressPool"
}
resource "azurerm_lb_backend_address_pool_address" "mypaddress" {
  name                    = "frontend-vm"
  backend_address_pool_id = azurerm_lb_backend_address_pool.mypool.id
  virtual_network_id      = "/subscriptions/dfebe681-aef0-468c-abc7-67690a6617de/resourceGroups/frontend-rg/providers/Microsoft.Network/virtualNetworks/frontendvnet"
  ip_address              = "10.0.1.4"
}
resource "azurerm_lb_backend_address_pool" "mypool2" {
  loadbalancer_id = azurerm_lb.mylb.id
  name            = "BackEndAddressPool2"
}
resource "azurerm_lb_backend_address_pool_address" "mypaddress2" {
  name                    = "backend-vm"
  backend_address_pool_id = azurerm_lb_backend_address_pool.mypool.id
  virtual_network_id      = "/subscriptions/dfebe681-aef0-468c-abc7-67690a6617de/resourceGroups/backend-rg/providers/Microsoft.Network/virtualNetworks/backendvnet"
  ip_address              = "10.0.1.4"
}