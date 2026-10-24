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

variable "aws_account_id" {
  description = "AWS account ID used to make the meals bucket name globally unique."
  type        = string
}

variable "environment" {
  description = "Environment used to name auth resources."
  type        = string
}

variable "distribution_path" {
  description = "Path to the root deployment bundles directory, relative to the environment root."
  type        = string
}

variable "project_name" {
  description = "Project name used to name auth resources."
  type        = string
}

variable "cognito_jwt_authorizer_id" {
  description = "ID of the Cognito JWT authorizer used to protect the meals routes."
  type        = string
}

variable "main_table_arn" {
  description = "ARN of the main DynamoDB table where create-meal writes meal items."
  type        = string
}

variable "main_table_name" {
  description = "Name of the main DynamoDB table passed to the create-meal function."
  type        = string
}
