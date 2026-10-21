output "create_meal_url" {
  description = "Public URL for the meal creation test route."
  value       = "${var.api_invoke_url}/meals"
}
