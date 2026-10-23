variable "environment" {
  description = "Environment provisioned by this root module."
  type        = string

  validation {
    condition     = contains(["dev", "homolog", "production"], var.environment)
    error_message = "The environment must be dev, homolog or production."
  }
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
