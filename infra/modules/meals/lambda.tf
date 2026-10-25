module "create_meal" {
  source = "../lambda"

  function_name         = "${var.project_name}-${var.environment}-create-meal"
  handler               = "createMeal.handler"
  filename              = data.archive_file.create_meal.output_path
  source_code_hash      = data.archive_file.create_meal.output_base64sha256
  configure_environment = true

  environment_variables = {
    MEALS_BUCKET    = aws_s3_bucket.meals.bucket
    MAIN_TABLE_NAME = var.main_table_name
  }
}

module "list_meals_by_day" {
  source = "../lambda"

  function_name         = "${var.project_name}-${var.environment}-list-meals-by-day"
  handler               = "listMealsByDay.handler"
  filename              = data.archive_file.list_meals_by_day.output_path
  source_code_hash      = data.archive_file.list_meals_by_day.output_base64sha256
  configure_environment = true

  environment_variables = {
    MAIN_TABLE_NAME = var.main_table_name
  }
}

module "get_meal_by_id" {
  source = "../lambda"

  function_name         = "${var.project_name}-${var.environment}-get-meal-by-id"
  handler               = "getMealById.handler"
  filename              = data.archive_file.get_meal_by_id.output_path
  source_code_hash      = data.archive_file.get_meal_by_id.output_base64sha256
  configure_environment = true

  environment_variables = {
    MAIN_TABLE_NAME       = var.main_table_name
    MEALS_CDN_DOMAIN_NAME = aws_cloudfront_distribution.meals.domain_name
  }
}
