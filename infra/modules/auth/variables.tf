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

variable "main_table_arn" {
  description = "ARN of the DynamoDB table used by the sign-up function."
  type        = string
}

variable "main_table_name" {
  description = "Name of the DynamoDB table passed to the sign-up function."
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

variable "ses_from_email_address" {
  description = "Verified sender email address used by Cognito through Amazon SES."
  type        = string
  sensitive   = true
}

variable "ses_identity_arn" {
  description = "ARN of the verified Amazon SES email identity used by the Cognito user pool."
  type        = string
  sensitive   = true
}

variable "source_account_id" {
  description = "AWS account ID used to scope Cognito invocation permission."
  type        = string
}
