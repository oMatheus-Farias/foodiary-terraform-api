data "archive_file" "get_me" {
  type        = "zip"
  source_file = "${var.distribution_path}/getMe.mjs"
  output_path = "${var.distribution_path}/getMe.zip"
}
