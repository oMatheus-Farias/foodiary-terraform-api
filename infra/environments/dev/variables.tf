variable "environment" {
  description = "Environment provisioned by this root module."
  type        = string

  validation {
    condition     = contains(["dev", "homolog", "production"], var.environment)
    error_message = "The environment must be dev, homolog or production."
  }
}
