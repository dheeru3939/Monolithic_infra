rgs = {
  "rg1" = {
    name       = "dev-RG39"
    location   = "Australia East"
    managed_by = "Terraform"
    tags = {
      environment = "development"
    }

  }
}

networks = {
  v1 = {
    name                = "dev-vnet-39"
    location            = "Australia East"
    resource_group_name = "dev-RG39"
    address_prefixes    = ["10.0.0.0/16"]
    tags = {
      environment = "dev"
    }
    subnet = {
      s1 = {
        name             = "dev39frontend-subnet"
        address_prefixes = ["10.0.1.0/24"]
      }
      s2 = {
        name             = "dev39backend-subnet"
        address_prefixes = ["10.0.2.0/24"]
      }
    }
  }


}


public_ips = {
  pip1 = {
    name                = "devpip391"
    resource_group_name = "dev-RG39"
    location            = "Australia East"
    allocation_method   = "Static"
    tags = {
      environment = "development"
    }
  }

  pip2 = {
    name                = "devpip392"
    resource_group_name = "dev-RG39"
    location            = "Australia East"
    allocation_method   = "Static"
    tags = {
      environment = "development"
    }
  }
}

vms = {
  vm1 = {
    nic_name            = "dev-nic-frontend-vm01"
    location            = "Australia East"
    resource_group_name = "dev-RG39"
    vnet                = "dev-vnet-39"
    subnet_name         = "dev39frontend-subnet"
    pip_name            = "devpip391"
    vm_name             = "dvvirtual391"
    size                = "Standard_D2s_v3"
    admin_username      = "dvadmin"
    admin_password      = "Welcome@39verma"
    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }
    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }

  }

  vm2 = {
    nic_name            = "dev-nic-backend-vm02"
    location            = "Australia East"
    resource_group_name = "dev-RG39"
    vnet                = "dev-vnet-39"
    subnet_name         = "dev39backend-subnet"
    pip_name            = "devpip392"
    vm_name             = "dvvirtual392"
    size                = "Standard_D2s_v3"
    admin_username      = "dvadmin"
    admin_password      = "Welcome@39verma"
    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }
    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }

  }

}

key_vaults = {
  kv1 = {
    kv_name             = "kv-dev-todoapp-39"
    location            = "Australia East"
    resource_group_name = "dev-RG39"
  }
}

sql_server = {
  sql = {
    name                         = "sql-dev-todoapp-39"
    resource_group_name          = "dev-RG39"
    location                     = "Australia East"
    version                      = "12.0"
    administrator_login          = "sqladmin"
    administrator_login_password = "Welcome@39verma"

  }
}
 
sql_database = {
  sql_DB = {
    name           = "sqldb-dev-todoapp-39"
    sql_server_key = "sql"

    collation   = "SQL_Latin1_General_CP1_CI_AS"
    max_size_gb = 2
    sku_name    = "S0"

    short_term_retention_policy = {
      retention_days = 7
    }
  }
}

