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
