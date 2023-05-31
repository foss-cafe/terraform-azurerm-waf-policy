output "id" {
  description = "The ID of the Web Application Firewall Policy."
  value       = try(azurerm_web_application_firewall_policy.this[0].id, "")
}
