output "resource_group_id" {
  value = azurerm_resource_group.main.id
}

output "vnet_name" {
  value = azurerm_virtual_network.main.name
}

output "subnet_id" {
  value = azurerm_subnet.main.id
}

output "load_balancer_public_ip" {
  description = "IP publique du Load Balancer — teste avec curl http://<cette IP>"
  value       = azurerm_public_ip.lb.ip_address
}