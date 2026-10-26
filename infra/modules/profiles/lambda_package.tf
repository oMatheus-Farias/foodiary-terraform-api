data "archive_file" "update_profile" {
  type        = "zip"
  source_file = "${var.distribution_path}/updateProfile.mjs"
  output_path = "${var.distribution_path}/updateProfile.zip"
}
