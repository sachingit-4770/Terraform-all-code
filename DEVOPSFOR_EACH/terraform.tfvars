storage_accounts = {
    account1001sa = {
      resource_group           = "my-rg"
      location                 = "East US"
      account_tier             = "Standard"
      account_replication_type = "LRS"
    },
    account2002sa = {
      resource_group           = "my-rg"
      location                 = "West US"
      account_tier             = "Standard"
      account_replication_type = "GRS"
    },
    account3003sa = {
      resource_group           = "my-rg"
      location                 = "Central US"
      account_tier             = "Premium"
      account_replication_type = "LRS"
    }
  }