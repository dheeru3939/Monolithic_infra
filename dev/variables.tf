variable "rgs" {
  type = map(object(
    {
      name       = string
      location   = string
      managed_by = string
      tags       = map(string)

    }
    )
  )

}

variable "networks" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_prefixes    = list(string)
    subnet = map(object(
      {
        name             = string
        address_prefixes = list(string)
      }
    ))

    }
  ))
}

variable "public_ips" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    allocation_method   = string
    tags                = map(string)
  }))
}

variable "vms" {
  type = map(object({
    nic_name            = string
    location            = string
    resource_group_name = string
    vnet                = string
    subnet_name         = string
    pip_name            = string
    vm_name             = string
    size                = string
    admin_username      = string
    admin_password      = string

    os_disk = object({
      caching              = string
      storage_account_type = string
    })

    source_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })
  }))
}

variable "key_vaults" {

}

variable "sql_server" {
  type = map(object({
    name                         = string
    resource_group_name          = string
    location                     = string
    version                      = string
    administrator_login          = string
    administrator_login_password = string

  }))
}

variable "sql_database" {
  type = map(object({
    name           = string
    sql_server_key = string
    collation      = string
    max_size_gb    = number
    sku_name       = string

    short_term_retention_policy = optional(object({
      retention_days = number
    }))
  }))
}
