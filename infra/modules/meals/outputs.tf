output "create_meal_url" {
  description = "Public URL for the meal creation test route."
  value       = "${var.api_invoke_url}/meals"
}

output "list_meals_by_day_url" {
  description = "URL of the authenticated route for listing meals by day."
  value       = "${var.api_invoke_url}/meals"
}
