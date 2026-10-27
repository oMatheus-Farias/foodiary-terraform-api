resource "aws_sqs_queue" "meals_dlq" {
  name                      = "${var.project_name}-${var.environment}-MealsDLQ"
  message_retention_seconds = 1209600
  sqs_managed_sse_enabled   = true
}

resource "aws_sqs_queue" "meals" {
  name                       = "${var.project_name}-${var.environment}-MealsQueue"
  visibility_timeout_seconds = 720
  receive_wait_time_seconds  = 20
  sqs_managed_sse_enabled    = true

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.meals_dlq.arn
    maxReceiveCount     = 2
  })
}

resource "aws_sns_topic" "dlq_alarms" {
  name = "${var.project_name}-${var.environment}-DLQAlarmsTopic"
}

resource "aws_sns_topic_subscription" "dlq_alarms_email" {
  topic_arn = aws_sns_topic.dlq_alarms.arn
  protocol  = "email"
  endpoint  = var.dlq_alarm_email
}

resource "aws_cloudwatch_metric_alarm" "meals_dlq" {
  alarm_name          = "${var.project_name}-${var.environment}-MealsDLQAlarm"
  alarm_description   = "Triggered when messages are found in the meals dead-letter queue."
  namespace           = "AWS/SQS"
  metric_name         = "ApproximateNumberOfMessagesVisible"
  dimensions          = { QueueName = aws_sqs_queue.meals_dlq.name }
  statistic           = "Average"
  period              = 60
  evaluation_periods  = 1
  threshold           = 0
  comparison_operator = "GreaterThanThreshold"
  treat_missing_data  = "notBreaching"
  alarm_actions       = [aws_sns_topic.dlq_alarms.arn]
}

data "aws_iam_policy_document" "on_meal_file_uploaded_sqs" {
  statement {
    sid       = "SendMealForProcessing"
    actions   = ["sqs:SendMessage"]
    resources = [aws_sqs_queue.meals.arn]
  }
}

resource "aws_iam_role_policy" "on_meal_file_uploaded_sqs" {
  name   = "${var.project_name}-${var.environment}-on-meal-file-uploaded-sqs"
  policy = data.aws_iam_policy_document.on_meal_file_uploaded_sqs.json
  role   = module.on_meal_file_uploaded.execution_role_name
}

data "aws_iam_policy_document" "process_meal_sqs" {
  statement {
    sid = "ConsumeMealsQueue"
    actions = [
      "sqs:ReceiveMessage",
      "sqs:DeleteMessage",
      "sqs:GetQueueAttributes",
    ]
    resources = [aws_sqs_queue.meals.arn]
  }
}

resource "aws_iam_role_policy" "process_meal_sqs" {
  name   = "${var.project_name}-${var.environment}-process-meal-sqs"
  policy = data.aws_iam_policy_document.process_meal_sqs.json
  role   = module.process_meal.execution_role_name
}

resource "aws_lambda_event_source_mapping" "process_meal_from_sqs" {
  event_source_arn = aws_sqs_queue.meals.arn
  function_name    = module.process_meal.arn
  batch_size       = 2
  enabled          = true

  depends_on = [aws_iam_role_policy.process_meal_sqs]
}

resource "aws_s3_bucket_notification" "meals" {
  bucket = aws_s3_bucket.meals.id

  lambda_function {
    lambda_function_arn = module.on_meal_file_uploaded.arn
    events              = ["s3:ObjectCreated:*"]
  }

  depends_on = [aws_lambda_permission.on_meal_file_uploaded_from_s3]
}
