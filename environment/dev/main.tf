module "azurerm_resource_group" {
  source = "../../modules/azurerm_resource_group"
  rgs    = var.rgs

}

module "azurerm_networking" {
  depends_on = [module.azurerm_resource_group]
  source     = "../../modules/azurerm_networking"
  networks   = var.networks

}


module "azurerm_public_ip" {
  depends_on = [module.azurerm_resource_group, module.azurerm_networking]
  source     = "../../modules/azurerm_public_ip"
  public_ips = var.public_ips
}



# module "azurerm_network_interface" {
#   depends_on = [module.azurerm_resource_group, module.azurerm_networking, module.azurerm_public_ip]
#   source     = "../../modules/azurerm_compute"
#   vms        = var.vms

# }

module "azurerm_compute" {
  depends_on = [module.azurerm_resource_group, module.azurerm_networking, module.azurerm_public_ip]
  source     = "../../modules/azurerm_compute"
  vms        = var.vms

}

module "key_vault" {
  depends_on = [module.azurerm_compute, module.azurerm_resource_group, module.azurerm_networking, module.azurerm_public_ip]

  source     = "../../modules/azurerm_key_vaults"
  key_vaults = var.key_vaults
}


module "sql_server" {
  source     = "../../modules/azurerm_sql_server"
  sql_server = var.sql_server
}

locals {
  sql_server_ids = {
    for k, v in module.sql_server.id :
    k => v
  }
}

module "sql_database" {
  depends_on = [ module.sql_server ]

  source = "../../modules/azurerm_sql_database"

  sql_database   = var.sql_database
  sql_server_ids = local.sql_server_ids
}
