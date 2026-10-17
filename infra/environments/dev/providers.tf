provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      ManagedBy   = "Terraform"
      Project     = local.project_name
      Environment = var.environment
    }
  }
}
