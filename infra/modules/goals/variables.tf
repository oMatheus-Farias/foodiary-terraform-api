variable "api_execution_arn" {
  description = "Execution ARN of the shared API Gateway, used to scope Lambda invocation permission."
  type        = string
}

variable "api_id" {
  description = "ID of the shared API Gateway HTTP API."
  type        = string
}

variable "api_invoke_url" {
  description = "Invoke URL of the shared API Gateway stage."
  type        = string
}

variable "api_stage_name" {
  description = "Name of the shared API Gateway stage."
  type        = string
}

variable "environment" {
  description = "Environment used to name goal resources."
  type        = string
}

variable "distribution_path" {
  description = "Path to the root deployment bundles directory, relative to the environment root."
  type        = string
}

variable "project_name" {
  description = "Project name used to name goal resources."
  type        = string
}

variable "cognito_jwt_authorizer_id" {
  description = "ID of the Cognito JWT authorizer used to protect the goal route."
  type        = string
}

variable "main_table_arn" {
  description = "ARN of the main DynamoDB table where goal items are stored."
  type        = string
}

variable "main_table_name" {
  description = "Name of the main DynamoDB table passed to the update-goal function."
  type        = string
}
