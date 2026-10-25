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
