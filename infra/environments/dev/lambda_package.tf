data "archive_file" "sign_up" {
  type        = "zip"
  source_file = "${path.module}/../../../dist/signUp.mjs"
  output_path = "${path.module}/../../../dist/signUp.zip"
}

data "archive_file" "pre_sign_up_trigger" {
  type        = "zip"
  source_file = "${path.module}/../../../dist/preSignUpTrigger.mjs"
  output_path = "${path.module}/../../../dist/preSignUpTrigger.zip"
}
