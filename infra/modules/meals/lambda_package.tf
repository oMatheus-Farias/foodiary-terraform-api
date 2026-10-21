data "archive_file" "create_meal" {
  type        = "zip"
  source_file = "${var.distribution_path}/createMeal.mjs"
  output_path = "${var.distribution_path}/createMeal.zip"
}
