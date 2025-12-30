# output "subnet_ids" {
#   value = {
#     for vnet_key, vnet in azurerm_virtual_network.vnet :
#     vnet_key => {
#       for subnet_key, subnet in vnet.subnet :
#       subnet_key => subnet.id
#     }
#   }
# }
