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
  description = "ID of the Cognito JWT authorizer used to protect the accounts routes."
  type        = string
}

variable "main_table_arn" {
  description = "ARN of the DynamoDB table queried by the get-me function."
  type        = string
}

variable "main_table_name" {
  description = "Name of the DynamoDB table passed to the get-me function."
  type        = string
}
