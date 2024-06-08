NICVari = {
#   Nic1 = {
#     name                = "frontend-nic"
#     location            = "centralindia"
#     resource_group_name = "frontend-rg"
#     subnet_id           = "/subscriptions/dfebe681-aef0-468c-abc7-67690a6617de/resourceGroups/frontend-rg/providers/Microsoft.Network/virtualNetworks/frontendvnet/subnets/forntend-subnet"
#   },
#   Nic2 = {
#     name                = "backend-nic"
#     location            = "centralindia"
#     resource_group_name = "backend-rg"
#     subnet_id           = "/subscriptions/dfebe681-aef0-468c-abc7-67690a6617de/resourceGroups/backend-rg/providers/Microsoft.Network/virtualNetworks/backendvnet/subnets/bakend-subnet"
#   }
  Nic3 = {
    name                = "LINUX-NIC"
    location            = "eastus"
    resource_group_name = "LINUX"
    subnet_id           = "/subscriptions/dfebe681-aef0-468c-abc7-67690a6617de/resourceGroups/LINUX/providers/Microsoft.Network/virtualNetworks/RSVVNET/subnets/RSVVMSUBNET"
  }
}