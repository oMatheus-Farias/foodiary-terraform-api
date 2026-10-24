module "get_me" {
  source = "../lambda"

  function_name         = "${var.project_name}-${var.environment}-get-me"
  handler               = "getMe.handler"
  filename              = data.archive_file.get_me.output_path
  source_code_hash      = data.archive_file.get_me.output_base64sha256
  configure_environment = true

  environment_variables = {
    MAIN_TABLE_NAME = var.main_table_name
  }
}
