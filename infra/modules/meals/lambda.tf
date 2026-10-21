module "create_meal" {
  source = "../lambda"

  function_name    = "${var.project_name}-${var.environment}-create-meal"
  handler          = "createMeal.handler"
  filename         = data.archive_file.create_meal.output_path
  source_code_hash = data.archive_file.create_meal.output_base64sha256
}
