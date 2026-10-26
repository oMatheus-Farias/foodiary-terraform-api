data "archive_file" "update_goal" {
  type        = "zip"
  source_file = "${var.distribution_path}/updateGoal.mjs"
  output_path = "${var.distribution_path}/updateGoal.zip"
}
