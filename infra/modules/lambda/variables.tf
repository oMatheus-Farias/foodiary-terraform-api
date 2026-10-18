variable "architectures" {
  description = "Instruction set architectures supported by the Lambda function."
  type        = list(string)
  default     = ["arm64"]

  validation {
    condition = length(var.architectures) == 1 ? contains(
      ["arm64", "x86_64"],
      var.architectures[0]
    ) : false
    error_message = "Specify exactly one supported architecture: arm64 or x86_64."
  }
}

variable "environment_variables" {
  description = "Environment variables passed to the Lambda function; values are treated as sensitive."
  type        = map(string)
  sensitive   = true
  default     = {}
}

variable "configure_environment" {
  description = "Whether to configure an environment block on the Lambda function."
  type        = bool
  default     = false
}

variable "filename" {
  description = "Path to the ZIP deployment package."
  type        = string
}

variable "function_name" {
  description = "Name shared by the Lambda function and its execution role."
  type        = string
}

variable "handler" {
  description = "Lambda handler in file.export format."
  type        = string
}

variable "log_retention_in_days" {
  description = "Number of days to retain this function's CloudWatch logs."
  type        = number
  default     = 1
}

variable "memory_size" {
  description = "Amount of memory available to the function, in MB."
  type        = number
  default     = 128

  validation {
    condition     = var.memory_size >= 128 && var.memory_size <= 10240
    error_message = "Lambda memory_size must be between 128 and 10240 MB."
  }
}

variable "runtime" {
  description = "Lambda runtime identifier."
  type        = string
  default     = "nodejs24.x"
}

variable "source_code_hash" {
  description = "Base64-encoded SHA-256 hash of the deployment package."
  type        = string
}

variable "timeout" {
  description = "Maximum execution time of the function, in seconds."
  type        = number
  default     = 3

  validation {
    condition     = var.timeout >= 1 && var.timeout <= 900
    error_message = "Lambda timeout must be between 1 and 900 seconds."
  }
}
