data "archive_file" "sign_up" {
  type        = "zip"
  source_file = "${path.module}/../../../dist/signUp.mjs"
  output_path = "${path.module}/../../../dist/signUp.zip"
}
