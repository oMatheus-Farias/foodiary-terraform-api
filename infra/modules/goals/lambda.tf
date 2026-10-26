module "update_goal" {
  source = "../lambda"

  function_name         = "${var.project_name}-${var.environment}-update-goal"
  handler               = "updateGoal.handler"
  filename              = data.archive_file.update_goal.output_path
  source_code_hash      = data.archive_file.update_goal.output_base64sha256
  configure_environment = true

  environment_variables = {
    MAIN_TABLE_NAME = var.main_table_name
  }
}
