# outputs.tf
# This file defines the outputs for the ExpressRoute configuration.

output "expressroute_id" {
  description = "The ID of the ExpressRoute circuit"
  value       = azurerm_express_route_circuit.er.id
}
