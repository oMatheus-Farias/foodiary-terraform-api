resource "aws_cloudwatch_log_group" "hello" {
  name              = "/aws/lambda/foodiary-api-dev-hello"
  retention_in_days = 1
}

resource "aws_cloudwatch_log_group" "api_access" {
  name              = "/aws/apigateway/foodiary-api-dev/access"
  retention_in_days = 1
}
