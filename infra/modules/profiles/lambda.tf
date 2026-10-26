module "update_profile" {
  source = "../lambda"

  function_name         = "${var.project_name}-${var.environment}-update-profile"
  handler               = "updateProfile.handler"
  filename              = data.archive_file.update_profile.output_path
  source_code_hash      = data.archive_file.update_profile.output_base64sha256
  configure_environment = true

  environment_variables = {
    MAIN_TABLE_NAME = var.main_table_name
  }
}
