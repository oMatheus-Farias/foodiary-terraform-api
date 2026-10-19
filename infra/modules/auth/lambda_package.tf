data "archive_file" "sign_up" {
  type        = "zip"
  source_file = "${var.distribution_path}/signUp.mjs"
  output_path = "${var.distribution_path}/signUp.zip"
}

data "archive_file" "pre_sign_up_trigger" {
  type        = "zip"
  source_file = "${var.distribution_path}/preSignUpTrigger.mjs"
  output_path = "${var.distribution_path}/preSignUpTrigger.zip"
}
