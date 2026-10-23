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

data "archive_file" "sign_in" {
  type        = "zip"
  source_file = "${var.distribution_path}/signIn.mjs"
  output_path = "${var.distribution_path}/signIn.zip"
}

data "archive_file" "pre_token_generation_trigger" {
  type        = "zip"
  source_file = "${var.distribution_path}/preTokenGenerationTrigger.mjs"
  output_path = "${var.distribution_path}/preTokenGenerationTrigger.zip"
}

data "archive_file" "refresh_token" {
  type        = "zip"
  source_file = "${var.distribution_path}/refreshToken.mjs"
  output_path = "${var.distribution_path}/refreshToken.zip"
}

data "archive_file" "forgot_password" {
  type        = "zip"
  source_file = "${var.distribution_path}/forgotPassword.mjs"
  output_path = "${var.distribution_path}/forgotPassword.zip"
}
