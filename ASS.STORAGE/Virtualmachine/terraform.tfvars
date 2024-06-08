VMVari = {
#     VM1 = {
#     name                  = "frontend-vm"
#     resource_group_name   = "frontend-rg"
#     location              = "centralindia"
#     size                  = "Standard_B1s"
#     admin_username        = "adminuser"
#     password = "Admin@2123456"
#     network_interface_ids = ["/subscriptions/dfebe681-aef0-468c-abc7-67690a6617de/resourceGroups/frontend-rg/providers/Microsoft.Network/networkInterfaces/frontend-nic"]
# },
#   VM2 = {
#     name                  = "backend-vm"
#     resource_group_name   = "backend-rg"
#     location              = "centralindia"
#     size                  = "Standard_B1s"
#     admin_username        = "adminuser"
#     password = "Admin@2123456"
#     network_interface_ids = ["/subscriptions/dfebe681-aef0-468c-abc7-67690a6617de/resourceGroups/backend-rg/providers/Microsoft.Network/networkInterfaces/backend-nic"]

#   }
  VM3 = {
    name                  = "NewrsvVM"
    resource_group_name   = "LINUX"
    location              = "eastus"
    size                  = "Standard_B1s"
    admin_username        = "adminuser"
    password = "Admin@2123456"
    network_interface_ids = ["/subscriptions/dfebe681-aef0-468c-abc7-67690a6617de/resourceGroups/LINUX/providers/Microsoft.Network/networkInterfaces/LINUX-NIC"]

  }
}
