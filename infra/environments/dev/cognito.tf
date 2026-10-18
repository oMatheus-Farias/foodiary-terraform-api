resource "aws_cognito_user_pool" "main" {
  name                = "${local.project_name}-${var.environment}-UserPool"
  deletion_protection = "INACTIVE"
  mfa_configuration   = "OFF"
  user_pool_tier      = "ESSENTIALS"

  auto_verified_attributes = ["email"]
  username_attributes      = ["email"]

  lambda_config {
    pre_sign_up = module.pre_sign_up_trigger.arn
  }

  admin_create_user_config {
    allow_admin_create_user_only = false
  }

  account_recovery_setting {
    recovery_mechanism {
      name     = "verified_email"
      priority = 1
    }
  }

  password_policy {
    minimum_length                   = 8
    require_lowercase                = false
    require_numbers                  = false
    require_symbols                  = false
    require_uppercase                = false
    temporary_password_validity_days = 7
  }

  schema {
    name                     = "internalId"
    attribute_data_type      = "String"
    required                 = false
    mutable                  = false
    developer_only_attribute = false

    string_attribute_constraints {
      min_length = 1
      max_length = 99
    }
  }
}

resource "aws_cognito_user_pool_client" "main" {
  name         = "${local.project_name}-${var.environment}-UserPoolClient"
  user_pool_id = aws_cognito_user_pool.main.id

  generate_secret     = true
  explicit_auth_flows = ["ALLOW_USER_PASSWORD_AUTH"]

  access_token_validity = 12

  token_validity_units {
    access_token = "hours"
  }

  refresh_token_rotation {
    feature                    = "ENABLED"
    retry_grace_period_seconds = 0
  }
}
