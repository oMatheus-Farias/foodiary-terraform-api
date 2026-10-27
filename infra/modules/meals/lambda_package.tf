data "archive_file" "create_meal" {
  type        = "zip"
  source_file = "${var.distribution_path}/createMeal.mjs"
  output_path = "${var.distribution_path}/createMeal.zip"
}

data "archive_file" "list_meals_by_day" {
  type        = "zip"
  source_file = "${var.distribution_path}/listMealsByDay.mjs"
  output_path = "${var.distribution_path}/listMealsByDay.zip"
}

data "archive_file" "get_meal_by_id" {
  type        = "zip"
  source_file = "${var.distribution_path}/getMealById.mjs"
  output_path = "${var.distribution_path}/getMealById.zip"
}

data "archive_file" "on_meal_file_uploaded" {
  type        = "zip"
  source_file = "${var.distribution_path}/onMealFileUploaded.mjs"
  output_path = "${var.distribution_path}/onMealFileUploaded.zip"
}

data "archive_file" "process_meal" {
  type        = "zip"
  source_file = "${var.distribution_path}/processMeal.mjs"
  output_path = "${var.distribution_path}/processMeal.zip"
}
