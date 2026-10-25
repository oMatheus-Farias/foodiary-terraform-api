output "create_meal_url" {
  description = "Public URL for the meal creation test route."
  value       = "${var.api_invoke_url}/meals"
}

output "list_meals_by_day_url" {
  description = "URL of the authenticated route for listing meals by day."
  value       = "${var.api_invoke_url}/meals"
}

output "get_meal_by_id_url" {
  description = "URL of the authenticated get-meal-by-id route."
  value       = "${var.api_invoke_url}/meals/{mealId}"
}

output "meals_cdn_domain_name" {
  description = "CloudFront domain serving objects from the meals bucket."
  value       = aws_cloudfront_distribution.meals.domain_name
}
