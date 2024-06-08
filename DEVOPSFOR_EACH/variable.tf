variable "storage_accounts" {
type = map(object({
          resource_group           = string
      location                 = string
      account_tier             = string
      account_replication_type = string
}))

}