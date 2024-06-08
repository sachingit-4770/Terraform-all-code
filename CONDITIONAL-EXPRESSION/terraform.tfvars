stg_map = {
  strg01 = {
    name                     = "mystgaccount5778957"
    resource_group_name      = "RG-CE"
    location                 = "eastus"
    account_tier             = "Standard"
    account_replication_type = "LRS"

    networkrule = {


      default_action = "Allow"

    }
   
  

   tag = {
      environment = "staging"
      id = "43536"
      asb = "tafta"
      faga = "hahah"
    }
}
}




